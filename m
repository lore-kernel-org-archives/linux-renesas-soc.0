Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55752 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725924AbeLCNUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 08:20:30 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Chris Ball <chris@printf.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH mmc-utils] fix GCC7 build by refactoring trimming routines
Date: Mon,  3 Dec 2018 14:19:23 +0100
Message-Id: <20181203131923.1487-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I got a compile error with GCC7. When trimming white spaces from strings
lsmmc uses strncpy with overlapping memory areas. This is not allowed.
In addition, the implementation was not efficient with calling strlen
and strncpy once per iteration. Refactor the code to be valid and more
effective.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 lsmmc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/lsmmc.c b/lsmmc.c
index c4faa00..9737b37 100644
--- a/lsmmc.c
+++ b/lsmmc.c
@@ -316,8 +316,9 @@ int parse_ids(struct config *config)
 /* MMC/SD file parsing functions */
 char *read_file(char *name)
 {
-	char *preparsed;
 	char line[4096];
+	char *preparsed, *start = line;
+	int len;
 	FILE *f;
 
 	f = fopen(name, "r");
@@ -348,12 +349,17 @@ char *read_file(char *name)
 	}
 
 	line[sizeof(line) - 1] = '\0';
+	len = strlen(line);
 
-	while (isspace(line[strlen(line) - 1]))
-		line[strlen(line) - 1] = '\0';
+	while (len > 0 && isspace(line[len - 1]))
+		len--;
 
-	while (isspace(line[0]))
-		strncpy(&line[0], &line[1], sizeof(line));
+	while (len > 0 && isspace(*start)) {
+		start++;
+		len--;
+	}
+	memmove(line, start, len);
+	line[len] = '\0';
 
 	return strdup(line);
 }
-- 
2.11.0
