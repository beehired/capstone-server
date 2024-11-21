-- CreateEnum
CREATE TYPE "Role" AS ENUM ('admin', 'recruiter', 'freelance');

-- CreateEnum
CREATE TYPE "paymentType" AS ENUM ('ewallet', 'card');

-- CreateTable
CREATE TABLE "User" (
    "userID" TEXT NOT NULL,
    "email" VARCHAR(300) NOT NULL,
    "plan" VARCHAR(100),
    "password" VARCHAR(300) NOT NULL,
    "role" "Role" NOT NULL,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "isArchive" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("userID")
);

-- CreateTable
CREATE TABLE "zintegration" (
    "integrationID" TEXT NOT NULL,
    "accountID" TEXT NOT NULL,
    "clientID" TEXT NOT NULL,
    "secretID" TEXT NOT NULL,
    "userID" TEXT,

    CONSTRAINT "zintegration_pkey" PRIMARY KEY ("integrationID")
);

-- CreateTable
CREATE TABLE "Subscription" (
    "subscriptionID" TEXT NOT NULL,
    "subscriptionId" TEXT NOT NULL,
    "userID" TEXT,

    CONSTRAINT "Subscription_pkey" PRIMARY KEY ("subscriptionID")
);

-- CreateTable
CREATE TABLE "Requirements" (
    "requirementsID" TEXT NOT NULL,
    "requirement" TEXT NOT NULL,
    "type" VARCHAR(300) NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,
    "companyID" TEXT,

    CONSTRAINT "Requirements_pkey" PRIMARY KEY ("requirementsID")
);

-- CreateTable
CREATE TABLE "Notification" (
    "notificationID" TEXT NOT NULL,
    "read" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "title" VARCHAR(300) NOT NULL,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("notificationID")
);

-- CreateTable
CREATE TABLE "Message" (
    "messageID" TEXT NOT NULL,
    "message" TEXT,
    "senderID" TEXT NOT NULL,
    "receiverID" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("messageID")
);

-- CreateTable
CREATE TABLE "MessageStatus" (
    "isRead" BOOLEAN NOT NULL DEFAULT false,
    "messageID" TEXT,
    "userID" TEXT,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "messageStatusID" TEXT NOT NULL,

    CONSTRAINT "MessageStatus_pkey" PRIMARY KEY ("messageStatusID")
);

-- CreateTable
CREATE TABLE "Company" (
    "companyID" TEXT NOT NULL,
    "companyName" VARCHAR(300) NOT NULL,
    "slug" VARCHAR(300) NOT NULL,
    "description" VARCHAR(1000) NOT NULL,
    "location" VARCHAR(300) NOT NULL,
    "companySize" VARCHAR(300) NOT NULL,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,

    CONSTRAINT "Company_pkey" PRIMARY KEY ("companyID")
);

-- CreateTable
CREATE TABLE "Profile" (
    "profileID" TEXT NOT NULL,
    "firstname" VARCHAR(256) NOT NULL,
    "lastname" VARCHAR(256) NOT NULL,
    "phone" TEXT,
    "birthday" DATE DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,
    "avatarID" TEXT,
    "fontFontID" TEXT,
    "headerID" TEXT,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("profileID")
);

-- CreateTable
CREATE TABLE "Social" (
    "socialID" TEXT NOT NULL,
    "instagram" TEXT,
    "facebook" TEXT,
    "Github" TEXT,
    "X" TEXT,
    "Web" TEXT,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "profileID" TEXT,

    CONSTRAINT "Social_pkey" PRIMARY KEY ("socialID")
);

-- CreateTable
CREATE TABLE "ResetPassword" (
    "resetPassID" TEXT NOT NULL,
    "reset" VARCHAR(200) NOT NULL,
    "expiredAt" TIMESTAMP(6) NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,

    CONSTRAINT "ResetPassword_pkey" PRIMARY KEY ("resetPassID")
);

-- CreateTable
CREATE TABLE "About" (
    "aboutID" TEXT NOT NULL,
    "bio" VARCHAR(1000),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "profileID" TEXT,

    CONSTRAINT "About_pkey" PRIMARY KEY ("aboutID")
);

-- CreateTable
CREATE TABLE "Skills" (
    "skillsID" TEXT NOT NULL,
    "skills" VARCHAR(100) NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aboutID" TEXT,
    "profileID" TEXT,

    CONSTRAINT "Skills_pkey" PRIMARY KEY ("skillsID")
);

-- CreateTable
CREATE TABLE "Media" (
    "mediaID" TEXT NOT NULL,
    "media" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "portfolioID" TEXT,
    "companyID" TEXT,

    CONSTRAINT "Media_pkey" PRIMARY KEY ("mediaID")
);

-- CreateTable
CREATE TABLE "Portfolio" (
    "portfolioID" TEXT NOT NULL,
    "title" VARCHAR(300) NOT NULL,
    "description" VARCHAR(1000) NOT NULL,
    "employmentType" VARCHAR(300) NOT NULL,
    "companyName" VARCHAR(300) NOT NULL,
    "location" VARCHAR(300) NOT NULL,
    "locationType" VARCHAR(300) NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "profileID" TEXT,
    "endMonth" VARCHAR(100),
    "endYear" VARCHAR(100),
    "startMonth" VARCHAR(100) NOT NULL,
    "startYear" VARCHAR(100) NOT NULL,

    CONSTRAINT "Portfolio_pkey" PRIMARY KEY ("portfolioID")
);

-- CreateTable
CREATE TABLE "Theme" (
    "themeID" TEXT NOT NULL,
    "theme" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,

    CONSTRAINT "Theme_pkey" PRIMARY KEY ("themeID")
);

-- CreateTable
CREATE TABLE "Font" (
    "fontID" TEXT NOT NULL,
    "font" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,

    CONSTRAINT "Font_pkey" PRIMARY KEY ("fontID")
);

-- CreateTable
CREATE TABLE "Education" (
    "educationID" TEXT NOT NULL,
    "school" VARCHAR(500) NOT NULL,
    "degree" VARCHAR(200) NOT NULL,
    "study" VARCHAR(300) NOT NULL,
    "startMonth" VARCHAR(100) NOT NULL,
    "startYear" VARCHAR(100) NOT NULL,
    "endMonth" VARCHAR(100),
    "endYear" VARCHAR(100),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "profileID" TEXT,

    CONSTRAINT "Education_pkey" PRIMARY KEY ("educationID")
);

-- CreateTable
CREATE TABLE "Resume" (
    "resumeID" TEXT NOT NULL,
    "resume" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "profileID" TEXT,
    "title" TEXT NOT NULL,

    CONSTRAINT "Resume_pkey" PRIMARY KEY ("resumeID")
);

-- CreateTable
CREATE TABLE "PasswordHash" (
    "passowrdID" TEXT NOT NULL,
    "passHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,

    CONSTRAINT "PasswordHash_pkey" PRIMARY KEY ("passowrdID")
);

-- CreateTable
CREATE TABLE "JobPost" (
    "jobPostID" TEXT NOT NULL,
    "title" VARCHAR(300) NOT NULL,
    "slug" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "location" VARCHAR(100) NOT NULL,
    "duration" VARCHAR(300) NOT NULL,
    "JobType" TEXT[],
    "endDate" DATE NOT NULL,
    "experience" VARCHAR(100) NOT NULL,
    "isArchive" BOOLEAN NOT NULL DEFAULT false,
    "isOpen" VARCHAR(200) NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "companyID" TEXT,
    "featured" BOOLEAN NOT NULL DEFAULT false,
    "status" VARCHAR(200) NOT NULL,
    "agreement" TEXT NOT NULL,

    CONSTRAINT "JobPost_pkey" PRIMARY KEY ("jobPostID")
);

-- CreateTable
CREATE TABLE "Salary" (
    "salaryID" TEXT NOT NULL,
    "fixed" INTEGER,
    "min" DOUBLE PRECISION,
    "max" DOUBLE PRECISION,
    "currency" VARCHAR(3) NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "jobPostID" TEXT,

    CONSTRAINT "Salary_pkey" PRIMARY KEY ("salaryID")
);

-- CreateTable
CREATE TABLE "Favourite" (
    "favouriteID" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,
    "jobpostID" TEXT,

    CONSTRAINT "Favourite_pkey" PRIMARY KEY ("favouriteID")
);

-- CreateTable
CREATE TABLE "Report" (
    "reportID" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "userID" TEXT,
    "jobpostID" TEXT,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Report_pkey" PRIMARY KEY ("reportID")
);

-- CreateTable
CREATE TABLE "Application" (
    "applicationID" TEXT NOT NULL,
    "id" VARCHAR(20) NOT NULL,
    "status" VARCHAR(200) NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "jobPostID" TEXT,
    "userID" TEXT,

    CONSTRAINT "Application_pkey" PRIMARY KEY ("applicationID")
);

-- CreateTable
CREATE TABLE "ActivityLogs" (
    "logsID" TEXT NOT NULL,
    "title" VARCHAR(200) NOT NULL,
    "description" VARCHAR(200) NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,

    CONSTRAINT "ActivityLogs_pkey" PRIMARY KEY ("logsID")
);

-- CreateTable
CREATE TABLE "ApplicationScore" (
    "applicationScoreID" TEXT NOT NULL,
    "score" DECIMAL(10,2) NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "applicationID" TEXT,

    CONSTRAINT "ApplicationScore_pkey" PRIMARY KEY ("applicationScoreID")
);

-- CreateTable
CREATE TABLE "Schedule" (
    "scheduleID" TEXT NOT NULL,
    "title" VARCHAR(300) NOT NULL,
    "description" VARCHAR(1000),
    "startDate" DATE NOT NULL,
    "endDate" DATE NOT NULL,
    "link" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "senderID" TEXT NOT NULL,
    "receiverID" TEXT NOT NULL,
    "endTime" VARCHAR(50) NOT NULL,
    "startTime" VARCHAR(50) NOT NULL,

    CONSTRAINT "Schedule_pkey" PRIMARY KEY ("scheduleID")
);

-- CreateTable
CREATE TABLE "Review" (
    "reviewID" TEXT NOT NULL,
    "review" TEXT NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,
    "companyID" TEXT,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("reviewID")
);

-- CreateTable
CREATE TABLE "ProjectOrganizer" (
    "projectOrganizerID" TEXT NOT NULL,
    "status" VARCHAR(100) NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "startDate" DATE NOT NULL,
    "endDate" DATE NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT,
    "companyID" TEXT,
    "title" VARCHAR(300) NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "ProjectOrganizer_pkey" PRIMARY KEY ("projectOrganizerID")
);

-- CreateTable
CREATE TABLE "_NotificationToProjectOrganizer" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_NotificationToSchedule" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CompanyToNotification" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ProfileToSkills" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ProfileToTheme" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_MediaToMessage" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_PortfolioToSkills" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_EducationToSkills" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_JobPostToSkills" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ApplicationToNotification" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ApplicationToResume" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "zintegration_userID_key" ON "zintegration"("userID");

-- CreateIndex
CREATE UNIQUE INDEX "Subscription_userID_key" ON "Subscription"("userID");

-- CreateIndex
CREATE UNIQUE INDEX "Company_userID_key" ON "Company"("userID");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userID_key" ON "Profile"("userID");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_avatarID_key" ON "Profile"("avatarID");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_headerID_key" ON "Profile"("headerID");

-- CreateIndex
CREATE UNIQUE INDEX "Social_profileID_key" ON "Social"("profileID");

-- CreateIndex
CREATE UNIQUE INDEX "About_profileID_key" ON "About"("profileID");

-- CreateIndex
CREATE UNIQUE INDEX "Skills_skills_key" ON "Skills"("skills");

-- CreateIndex
CREATE UNIQUE INDEX "Media_companyID_key" ON "Media"("companyID");

-- CreateIndex
CREATE UNIQUE INDEX "Salary_jobPostID_key" ON "Salary"("jobPostID");

-- CreateIndex
CREATE UNIQUE INDEX "ApplicationScore_applicationID_key" ON "ApplicationScore"("applicationID");

-- CreateIndex
CREATE UNIQUE INDEX "_NotificationToProjectOrganizer_AB_unique" ON "_NotificationToProjectOrganizer"("A", "B");

-- CreateIndex
CREATE INDEX "_NotificationToProjectOrganizer_B_index" ON "_NotificationToProjectOrganizer"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_NotificationToSchedule_AB_unique" ON "_NotificationToSchedule"("A", "B");

-- CreateIndex
CREATE INDEX "_NotificationToSchedule_B_index" ON "_NotificationToSchedule"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CompanyToNotification_AB_unique" ON "_CompanyToNotification"("A", "B");

-- CreateIndex
CREATE INDEX "_CompanyToNotification_B_index" ON "_CompanyToNotification"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProfileToSkills_AB_unique" ON "_ProfileToSkills"("A", "B");

-- CreateIndex
CREATE INDEX "_ProfileToSkills_B_index" ON "_ProfileToSkills"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProfileToTheme_AB_unique" ON "_ProfileToTheme"("A", "B");

-- CreateIndex
CREATE INDEX "_ProfileToTheme_B_index" ON "_ProfileToTheme"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_MediaToMessage_AB_unique" ON "_MediaToMessage"("A", "B");

-- CreateIndex
CREATE INDEX "_MediaToMessage_B_index" ON "_MediaToMessage"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PortfolioToSkills_AB_unique" ON "_PortfolioToSkills"("A", "B");

-- CreateIndex
CREATE INDEX "_PortfolioToSkills_B_index" ON "_PortfolioToSkills"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EducationToSkills_AB_unique" ON "_EducationToSkills"("A", "B");

-- CreateIndex
CREATE INDEX "_EducationToSkills_B_index" ON "_EducationToSkills"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_JobPostToSkills_AB_unique" ON "_JobPostToSkills"("A", "B");

-- CreateIndex
CREATE INDEX "_JobPostToSkills_B_index" ON "_JobPostToSkills"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ApplicationToNotification_AB_unique" ON "_ApplicationToNotification"("A", "B");

-- CreateIndex
CREATE INDEX "_ApplicationToNotification_B_index" ON "_ApplicationToNotification"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ApplicationToResume_AB_unique" ON "_ApplicationToResume"("A", "B");

-- CreateIndex
CREATE INDEX "_ApplicationToResume_B_index" ON "_ApplicationToResume"("B");

-- AddForeignKey
ALTER TABLE "zintegration" ADD CONSTRAINT "zintegration_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Requirements" ADD CONSTRAINT "Requirements_companyID_fkey" FOREIGN KEY ("companyID") REFERENCES "Company"("companyID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Requirements" ADD CONSTRAINT "Requirements_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_receiverID_fkey" FOREIGN KEY ("receiverID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_senderID_fkey" FOREIGN KEY ("senderID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MessageStatus" ADD CONSTRAINT "MessageStatus_messageID_fkey" FOREIGN KEY ("messageID") REFERENCES "Message"("messageID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MessageStatus" ADD CONSTRAINT "MessageStatus_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Company" ADD CONSTRAINT "Company_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_avatarID_fkey" FOREIGN KEY ("avatarID") REFERENCES "Media"("mediaID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_fontFontID_fkey" FOREIGN KEY ("fontFontID") REFERENCES "Font"("fontID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_headerID_fkey" FOREIGN KEY ("headerID") REFERENCES "Media"("mediaID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Social" ADD CONSTRAINT "Social_profileID_fkey" FOREIGN KEY ("profileID") REFERENCES "Profile"("profileID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResetPassword" ADD CONSTRAINT "ResetPassword_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "About" ADD CONSTRAINT "About_profileID_fkey" FOREIGN KEY ("profileID") REFERENCES "Profile"("profileID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Skills" ADD CONSTRAINT "Skills_aboutID_fkey" FOREIGN KEY ("aboutID") REFERENCES "About"("aboutID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Media" ADD CONSTRAINT "Media_companyID_fkey" FOREIGN KEY ("companyID") REFERENCES "Company"("companyID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Media" ADD CONSTRAINT "Media_portfolioID_fkey" FOREIGN KEY ("portfolioID") REFERENCES "Portfolio"("portfolioID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Portfolio" ADD CONSTRAINT "Portfolio_profileID_fkey" FOREIGN KEY ("profileID") REFERENCES "Profile"("profileID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Theme" ADD CONSTRAINT "Theme_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Font" ADD CONSTRAINT "Font_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_profileID_fkey" FOREIGN KEY ("profileID") REFERENCES "Profile"("profileID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Resume" ADD CONSTRAINT "Resume_profileID_fkey" FOREIGN KEY ("profileID") REFERENCES "Profile"("profileID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PasswordHash" ADD CONSTRAINT "PasswordHash_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobPost" ADD CONSTRAINT "JobPost_companyID_fkey" FOREIGN KEY ("companyID") REFERENCES "Company"("companyID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Salary" ADD CONSTRAINT "Salary_jobPostID_fkey" FOREIGN KEY ("jobPostID") REFERENCES "JobPost"("jobPostID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Favourite" ADD CONSTRAINT "Favourite_jobpostID_fkey" FOREIGN KEY ("jobpostID") REFERENCES "JobPost"("jobPostID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Favourite" ADD CONSTRAINT "Favourite_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_jobpostID_fkey" FOREIGN KEY ("jobpostID") REFERENCES "JobPost"("jobPostID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Application" ADD CONSTRAINT "Application_jobPostID_fkey" FOREIGN KEY ("jobPostID") REFERENCES "JobPost"("jobPostID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Application" ADD CONSTRAINT "Application_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityLogs" ADD CONSTRAINT "ActivityLogs_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ApplicationScore" ADD CONSTRAINT "ApplicationScore_applicationID_fkey" FOREIGN KEY ("applicationID") REFERENCES "Application"("applicationID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_receiverID_fkey" FOREIGN KEY ("receiverID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_senderID_fkey" FOREIGN KEY ("senderID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_companyID_fkey" FOREIGN KEY ("companyID") REFERENCES "Company"("companyID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectOrganizer" ADD CONSTRAINT "ProjectOrganizer_companyID_fkey" FOREIGN KEY ("companyID") REFERENCES "Company"("companyID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectOrganizer" ADD CONSTRAINT "ProjectOrganizer_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NotificationToProjectOrganizer" ADD CONSTRAINT "_NotificationToProjectOrganizer_A_fkey" FOREIGN KEY ("A") REFERENCES "Notification"("notificationID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NotificationToProjectOrganizer" ADD CONSTRAINT "_NotificationToProjectOrganizer_B_fkey" FOREIGN KEY ("B") REFERENCES "ProjectOrganizer"("projectOrganizerID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NotificationToSchedule" ADD CONSTRAINT "_NotificationToSchedule_A_fkey" FOREIGN KEY ("A") REFERENCES "Notification"("notificationID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NotificationToSchedule" ADD CONSTRAINT "_NotificationToSchedule_B_fkey" FOREIGN KEY ("B") REFERENCES "Schedule"("scheduleID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompanyToNotification" ADD CONSTRAINT "_CompanyToNotification_A_fkey" FOREIGN KEY ("A") REFERENCES "Company"("companyID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompanyToNotification" ADD CONSTRAINT "_CompanyToNotification_B_fkey" FOREIGN KEY ("B") REFERENCES "Notification"("notificationID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProfileToSkills" ADD CONSTRAINT "_ProfileToSkills_A_fkey" FOREIGN KEY ("A") REFERENCES "Profile"("profileID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProfileToSkills" ADD CONSTRAINT "_ProfileToSkills_B_fkey" FOREIGN KEY ("B") REFERENCES "Skills"("skillsID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProfileToTheme" ADD CONSTRAINT "_ProfileToTheme_A_fkey" FOREIGN KEY ("A") REFERENCES "Profile"("profileID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProfileToTheme" ADD CONSTRAINT "_ProfileToTheme_B_fkey" FOREIGN KEY ("B") REFERENCES "Theme"("themeID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MediaToMessage" ADD CONSTRAINT "_MediaToMessage_A_fkey" FOREIGN KEY ("A") REFERENCES "Media"("mediaID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MediaToMessage" ADD CONSTRAINT "_MediaToMessage_B_fkey" FOREIGN KEY ("B") REFERENCES "Message"("messageID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioToSkills" ADD CONSTRAINT "_PortfolioToSkills_A_fkey" FOREIGN KEY ("A") REFERENCES "Portfolio"("portfolioID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PortfolioToSkills" ADD CONSTRAINT "_PortfolioToSkills_B_fkey" FOREIGN KEY ("B") REFERENCES "Skills"("skillsID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EducationToSkills" ADD CONSTRAINT "_EducationToSkills_A_fkey" FOREIGN KEY ("A") REFERENCES "Education"("educationID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EducationToSkills" ADD CONSTRAINT "_EducationToSkills_B_fkey" FOREIGN KEY ("B") REFERENCES "Skills"("skillsID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_JobPostToSkills" ADD CONSTRAINT "_JobPostToSkills_A_fkey" FOREIGN KEY ("A") REFERENCES "JobPost"("jobPostID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_JobPostToSkills" ADD CONSTRAINT "_JobPostToSkills_B_fkey" FOREIGN KEY ("B") REFERENCES "Skills"("skillsID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ApplicationToNotification" ADD CONSTRAINT "_ApplicationToNotification_A_fkey" FOREIGN KEY ("A") REFERENCES "Application"("applicationID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ApplicationToNotification" ADD CONSTRAINT "_ApplicationToNotification_B_fkey" FOREIGN KEY ("B") REFERENCES "Notification"("notificationID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ApplicationToResume" ADD CONSTRAINT "_ApplicationToResume_A_fkey" FOREIGN KEY ("A") REFERENCES "Application"("applicationID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ApplicationToResume" ADD CONSTRAINT "_ApplicationToResume_B_fkey" FOREIGN KEY ("B") REFERENCES "Resume"("resumeID") ON DELETE CASCADE ON UPDATE CASCADE;
