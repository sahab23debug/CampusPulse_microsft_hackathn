BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "abuse_report" (
    "id" bigserial PRIMARY KEY,
    "reporterUserId" bigint NOT NULL,
    "reporterUserName" text NOT NULL,
    "targetType" text NOT NULL,
    "targetId" bigint NOT NULL,
    "reason" text NOT NULL,
    "status" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "report_status_idx" ON "abuse_report" USING btree ("status");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "attendance_log" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "subjectId" bigint NOT NULL,
    "date" timestamp without time zone NOT NULL,
    "status" text NOT NULL,
    "source" text NOT NULL
);

-- Indexes
CREATE INDEX "attendance_log_user_date_idx" ON "attendance_log" USING btree ("userId", "date");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "attendance_record" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "subjectId" bigint NOT NULL,
    "subjectName" text NOT NULL,
    "subjectCode" text NOT NULL,
    "classesAttended" bigint NOT NULL,
    "totalClassesHeld" bigint NOT NULL,
    "requiredPercentage" double precision NOT NULL,
    "plannedTotalClasses" bigint,
    "lastUpdated" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "attendance_user_subject_idx" ON "attendance_record" USING btree ("userId", "subjectId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "bookmark" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "resourceType" text NOT NULL,
    "targetId" bigint NOT NULL,
    "title" text NOT NULL,
    "subtitle" text,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "bookmark_user_target_idx" ON "bookmark" USING btree ("userId", "resourceType", "targetId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "branch" (
    "id" bigserial PRIMARY KEY,
    "collegeId" bigint NOT NULL,
    "name" text NOT NULL,
    "code" text NOT NULL,
    "degree" text NOT NULL
);

-- Indexes
CREATE INDEX "branch_college_idx" ON "branch" USING btree ("collegeId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "calendar_event" (
    "id" bigserial PRIMARY KEY,
    "collegeId" bigint,
    "sectionId" bigint,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "eventType" text NOT NULL,
    "startDate" timestamp without time zone NOT NULL,
    "endDate" timestamp without time zone NOT NULL,
    "isAllDay" boolean NOT NULL,
    "venue" text
);

-- Indexes
CREATE INDEX "cal_event_college_date_idx" ON "calendar_event" USING btree ("collegeId", "startDate");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "campus_event" (
    "id" bigserial PRIMARY KEY,
    "collegeId" bigint NOT NULL,
    "organizerClub" text NOT NULL,
    "creatorUserId" bigint NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "posterUrl" text NOT NULL,
    "venue" text NOT NULL,
    "eventDate" timestamp without time zone NOT NULL,
    "registrationDeadline" timestamp without time zone NOT NULL,
    "capacity" bigint,
    "registrationCount" bigint NOT NULL,
    "registrationUrl" text,
    "isInternalRegistration" boolean NOT NULL,
    "tags" json NOT NULL,
    "isApproved" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "campus_event_deadline_idx" ON "campus_event" USING btree ("collegeId", "registrationDeadline");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "chat_message" (
    "id" bigserial PRIMARY KEY,
    "conversationId" bigint NOT NULL,
    "senderId" bigint NOT NULL,
    "senderName" text NOT NULL,
    "content" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "isRead" boolean NOT NULL
);

-- Indexes
CREATE INDEX "chat_msg_conv_time_idx" ON "chat_message" USING btree ("conversationId", "createdAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "college" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "code" text NOT NULL,
    "city" text NOT NULL,
    "state" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "college_code_idx" ON "college" USING btree ("code");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "community" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "iconUrl" text,
    "creatorUserId" bigint NOT NULL,
    "collegeId" bigint,
    "isPrivate" boolean NOT NULL,
    "memberCount" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "community_category_idx" ON "community" USING btree ("category");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "community_member" (
    "id" bigserial PRIMARY KEY,
    "communityId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "userName" text NOT NULL,
    "role" text NOT NULL,
    "joinedAt" timestamp without time zone NOT NULL,
    "isApproved" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "comm_member_unique_idx" ON "community_member" USING btree ("communityId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "community_post" (
    "id" bigserial PRIMARY KEY,
    "communityId" bigint NOT NULL,
    "authorId" bigint NOT NULL,
    "authorName" text NOT NULL,
    "authorAvatarUrl" text,
    "content" text NOT NULL,
    "imageUrl" text,
    "isAnnouncement" boolean NOT NULL,
    "isPinned" boolean NOT NULL,
    "likeCount" bigint NOT NULL,
    "commentCount" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "comm_post_comm_idx" ON "community_post" USING btree ("communityId", "createdAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "connection_request" (
    "id" bigserial PRIMARY KEY,
    "senderId" bigint NOT NULL,
    "senderName" text NOT NULL,
    "receiverId" bigint NOT NULL,
    "receiverName" text NOT NULL,
    "note" text NOT NULL,
    "status" text NOT NULL,
    "messageCountBeforeAccept" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "conn_req_sender_recv_idx" ON "connection_request" USING btree ("senderId", "receiverId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "conversation" (
    "id" bigserial PRIMARY KEY,
    "user1Id" bigint NOT NULL,
    "user2Id" bigint NOT NULL,
    "lastMessageSnippet" text,
    "lastMessageAt" timestamp without time zone,
    "user1UnreadCount" bigint NOT NULL,
    "user2UnreadCount" bigint NOT NULL,
    "isAccepted" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "conversation_users_idx" ON "conversation" USING btree ("user1Id", "user2Id");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "event_registration" (
    "id" bigserial PRIMARY KEY,
    "eventId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "userName" text NOT NULL,
    "userEmail" text NOT NULL,
    "registeredAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "event_reg_unique_idx" ON "event_registration" USING btree ("eventId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "player_rating" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "userName" text NOT NULL,
    "collegeId" bigint NOT NULL,
    "branchId" bigint NOT NULL,
    "year" bigint NOT NULL,
    "rating" bigint NOT NULL,
    "matchesPlayed" bigint NOT NULL,
    "matchesWon" bigint NOT NULL,
    "weeklyScore" bigint NOT NULL,
    "lastUpdated" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "player_rating_user_idx" ON "player_rating" USING btree ("userId");
CREATE INDEX "player_rating_college_idx" ON "player_rating" USING btree ("collegeId", "rating");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz_answer" (
    "id" bigserial PRIMARY KEY,
    "matchId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "questionId" bigint NOT NULL,
    "selectedOptionIndex" bigint NOT NULL,
    "timeTakenMs" bigint NOT NULL,
    "isCorrect" boolean NOT NULL,
    "pointsEarned" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "quiz_ans_match_q_u_idx" ON "quiz_answer" USING btree ("matchId", "questionId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz_match" (
    "id" bigserial PRIMARY KEY,
    "mode" text NOT NULL,
    "roomCode" text,
    "subject" text NOT NULL,
    "difficulty" text NOT NULL,
    "status" text NOT NULL,
    "questionIdsJson" text NOT NULL,
    "currentQuestionIndex" bigint NOT NULL,
    "startedAt" timestamp without time zone,
    "endedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "quiz_match_room_idx" ON "quiz_match" USING btree ("roomCode");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz_match_player" (
    "id" bigserial PRIMARY KEY,
    "matchId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "userName" text NOT NULL,
    "userAvatarUrl" text,
    "score" bigint NOT NULL,
    "correctAnswersCount" bigint NOT NULL,
    "ratingBefore" bigint NOT NULL,
    "ratingAfter" bigint,
    "isFinished" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "quiz_player_match_idx" ON "quiz_match_player" USING btree ("matchId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz_question" (
    "id" bigserial PRIMARY KEY,
    "subject" text NOT NULL,
    "topic" text NOT NULL,
    "difficulty" text NOT NULL,
    "questionText" text NOT NULL,
    "optionA" text NOT NULL,
    "optionB" text NOT NULL,
    "optionC" text NOT NULL,
    "optionD" text NOT NULL,
    "correctOptionIndex" bigint NOT NULL,
    "explanation" text NOT NULL,
    "textHash" text NOT NULL,
    "usageCount" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "quiz_question_subj_diff_idx" ON "quiz_question" USING btree ("subject", "difficulty");
CREATE UNIQUE INDEX "quiz_question_hash_idx" ON "quiz_question" USING btree ("textHash");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "rental_item" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "ownerName" text NOT NULL,
    "title" text NOT NULL,
    "category" text NOT NULL,
    "description" text NOT NULL,
    "photosJson" text NOT NULL,
    "rentPricePerDay" double precision NOT NULL,
    "depositAmount" double precision NOT NULL,
    "condition" text NOT NULL,
    "isAvailable" boolean NOT NULL,
    "pickupPlace" text NOT NULL,
    "collegeId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "rental_item_college_avail_idx" ON "rental_item" USING btree ("collegeId", "isAvailable");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "rental_request" (
    "id" bigserial PRIMARY KEY,
    "itemId" bigint NOT NULL,
    "renterId" bigint NOT NULL,
    "renterName" text NOT NULL,
    "ownerId" bigint NOT NULL,
    "status" text NOT NULL,
    "consentAgreed" boolean NOT NULL,
    "startDate" timestamp without time zone NOT NULL,
    "returnDueDate" timestamp without time zone NOT NULL,
    "handoverPhotosJson" text,
    "returnPhotosJson" text,
    "totalRentAmount" double precision NOT NULL,
    "depositHeld" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "rental_req_item_renter_idx" ON "rental_request" USING btree ("itemId", "renterId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "requirement" (
    "id" bigserial PRIMARY KEY,
    "creatorId" bigint NOT NULL,
    "creatorName" text NOT NULL,
    "creatorCollege" text NOT NULL,
    "creatorBranch" text NOT NULL,
    "creatorYear" bigint NOT NULL,
    "purpose" text NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "requiredSkills" json NOT NULL,
    "preferredSkills" json NOT NULL,
    "teamSizeNeeded" bigint NOT NULL,
    "deadline" timestamp without time zone,
    "preferredBranch" text,
    "preferredYear" bigint,
    "proximity" text,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "requirement_purpose_idx" ON "requirement" USING btree ("purpose");
CREATE INDEX "requirement_creator_idx" ON "requirement" USING btree ("creatorId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "resource" (
    "id" bigserial PRIMARY KEY,
    "uploaderId" bigint NOT NULL,
    "uploaderName" text NOT NULL,
    "uploaderSgpa" double precision,
    "uploaderSemester" bigint,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "subjectId" bigint NOT NULL,
    "subjectName" text NOT NULL,
    "semester" bigint NOT NULL,
    "branchId" bigint NOT NULL,
    "year" bigint NOT NULL,
    "resourceType" text NOT NULL,
    "fileUrl" text,
    "externalUrl" text,
    "tags" json NOT NULL,
    "viewsCount" bigint NOT NULL,
    "followCount" bigint NOT NULL,
    "averageRating" double precision NOT NULL,
    "ratingCount" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "resource_branch_year_idx" ON "resource" USING btree ("branchId", "year");
CREATE INDEX "resource_subject_idx" ON "resource" USING btree ("subjectId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "resource_comment" (
    "id" bigserial PRIMARY KEY,
    "resourceId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "userName" text NOT NULL,
    "userAvatarUrl" text,
    "content" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "isReported" boolean NOT NULL
);

-- Indexes
CREATE INDEX "res_comment_res_idx" ON "resource_comment" USING btree ("resourceId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "resource_follow" (
    "id" bigserial PRIMARY KEY,
    "resourceId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "res_follow_uniq_idx" ON "resource_follow" USING btree ("resourceId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "resource_rating" (
    "id" bigserial PRIMARY KEY,
    "resourceId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "userName" text NOT NULL,
    "rating" bigint NOT NULL,
    "review" text,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "res_rating_user_idx" ON "resource_rating" USING btree ("resourceId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "section" (
    "id" bigserial PRIMARY KEY,
    "branchId" bigint NOT NULL,
    "name" text NOT NULL,
    "year" bigint NOT NULL,
    "semester" bigint NOT NULL
);

-- Indexes
CREATE INDEX "section_branch_idx" ON "section" USING btree ("branchId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "subject" (
    "id" bigserial PRIMARY KEY,
    "branchId" bigint NOT NULL,
    "semester" bigint NOT NULL,
    "name" text NOT NULL,
    "code" text NOT NULL,
    "credits" bigint NOT NULL
);

-- Indexes
CREATE INDEX "subject_branch_sem_idx" ON "subject" USING btree ("branchId", "semester");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "timetable_entry" (
    "id" bigserial PRIMARY KEY,
    "sectionId" bigint NOT NULL,
    "subjectId" bigint NOT NULL,
    "subjectName" text NOT NULL,
    "subjectCode" text NOT NULL,
    "facultyName" text NOT NULL,
    "roomNumber" text NOT NULL,
    "dayOfWeek" bigint NOT NULL,
    "startTime" text NOT NULL,
    "endTime" text NOT NULL,
    "type" text NOT NULL
);

-- Indexes
CREATE INDEX "timetable_section_day_idx" ON "timetable_entry" USING btree ("sectionId", "dayOfWeek");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_profile" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "fullName" text NOT NULL,
    "email" text NOT NULL,
    "avatarUrl" text,
    "collegeId" bigint NOT NULL,
    "collegeName" text NOT NULL,
    "branchId" bigint NOT NULL,
    "branchName" text NOT NULL,
    "sectionId" bigint NOT NULL,
    "sectionName" text NOT NULL,
    "year" bigint NOT NULL,
    "semester" bigint NOT NULL,
    "bio" text,
    "interests" json NOT NULL,
    "skills" json NOT NULL,
    "githubUrl" text,
    "linkedinUrl" text,
    "role" text NOT NULL,
    "sgpaJson" text,
    "notesUploadedCount" bigint NOT NULL,
    "averageRatingReceived" double precision NOT NULL,
    "quizRank" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_profile_userinfo_idx" ON "user_profile" USING btree ("userInfoId");
CREATE INDEX "user_profile_college_idx" ON "user_profile" USING btree ("collegeId");
CREATE INDEX "user_profile_branch_idx" ON "user_profile" USING btree ("branchId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL,
    "contentType" text,
    "cacheControl" text,
    "contentDisposition" text,
    "contentEncoding" text,
    "customMetadata" text
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_cloud_storage_direct_download" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL,
    "downloadFileName" text,
    "contentType" text
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_download_auth_key" ON "serverpod_cloud_storage_direct_download" USING btree ("authKey");
CREATE INDEX "serverpod_cloud_storage_direct_download_expiration" ON "serverpod_cloud_storage_direct_download" USING btree ("expiration");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL,
    "maxFileSize" bigint NOT NULL DEFAULT 10485760,
    "contentLength" bigint,
    "preventOverwrite" boolean NOT NULL DEFAULT false,
    "contentType" text,
    "cacheControl" text,
    "contentDisposition" text,
    "contentEncoding" text,
    "customMetadata" text
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text,
    "scheduling" json
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_future_call_claim" (
    "id" bigserial PRIMARY KEY,
    "futureCallId" bigint,
    "lastHeartbeatTime" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "future_call_unique_idx" ON "serverpod_future_call_claim" USING btree ("futureCallId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId", "order");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_message_log_sessionLogId_idx" ON "serverpod_message_log" USING btree ("sessionLogId", "order");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId", "order");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "userId" text,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_time_idx" ON "serverpod_session_log" USING btree ("time");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_auth_key" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "hash" text NOT NULL,
    "scopeNames" json NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_auth_key_userId_idx" ON "serverpod_auth_key" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_auth" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_email" ON "serverpod_email_auth" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_create_request" (
    "id" bigserial PRIMARY KEY,
    "userName" text NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL,
    "verificationCode" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_create_account_request_idx" ON "serverpod_email_create_request" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_failed_sign_in" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "ipAddress" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_email_failed_sign_in_email_idx" ON "serverpod_email_failed_sign_in" USING btree ("email");
CREATE INDEX "serverpod_email_failed_sign_in_time_idx" ON "serverpod_email_failed_sign_in" USING btree ("time");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_reset" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "verificationCode" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_reset_verification_idx" ON "serverpod_email_reset" USING btree ("verificationCode");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_google_refresh_token" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON "serverpod_google_refresh_token" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_user_image" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "version" bigint NOT NULL,
    "url" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_user_image_user_id" ON "serverpod_user_image" USING btree ("userId", "version");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_user_info" (
    "id" bigserial PRIMARY KEY,
    "userIdentifier" text NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "created" timestamp without time zone NOT NULL,
    "imageUrl" text,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_user_info_user_identifier" ON "serverpod_user_info" USING btree ("userIdentifier");
CREATE INDEX "serverpod_user_info_email" ON "serverpod_user_info" USING btree ("email");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "serverpod_future_call_claim"
    ADD CONSTRAINT "serverpod_future_call_claim_fk_0"
    FOREIGN KEY("futureCallId")
    REFERENCES "serverpod_future_call"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR campuspulse
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('campuspulse', '20261029210044741', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261029210044741', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20260824182343939', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182343939', "timestamp" = now();


COMMIT;
