Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=Z9HC=2D=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH 1/1] scripts: bin2png.sh: Fix POSIX shell compliance
Date: Wed, 22 Feb 2017 15:52:43 +0000
Message-Id: <1487778763-10482-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20170213141522.11545-1-laurent.pinchart@ideasonboard.com>
References: <20170213141522.11545-1-laurent.pinchart@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The string manipulations of the form ${VAR/search/replace} are not posix
compliant. Use string deletion, and append instead.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/bin2png.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/bin2png.sh b/scripts/bin2png.sh
index 090f31fa992d..6422ee51bc33 100755
--- a/scripts/bin2png.sh
+++ b/scripts/bin2png.sh
@@ -4,8 +4,8 @@ FILE=${1:-.}
 
 convert_image() {
 	local file=$1
-	local pnm=${file/%bin/pnm}
-	local png=${file/%bin/png}
+	local pnm=${file%bin}pnm
+	local png=${file%bin}png
 
 	local format=$(echo $file | sed -e 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\1|' | tr '[:lower:]' '[:upper:]')
 	local size=$(echo $file   | sed -e 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\2|')
-- 
2.7.4
