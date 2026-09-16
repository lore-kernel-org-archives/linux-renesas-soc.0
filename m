Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC9935675E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 23:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603014; cv=none; b=kdGgra3I7aIgnFkibkKWmmn6o3cBJ5ESQvfVhTHGE7Rnipd4/iZa8Kwx+PDiP+JItfcnodUdQvzgzaLIMekaX66g/um21m/NpEDpr0G9oG47y39VaTAev6WpY7myErRoldUiDTcp4KVHVsBG25Y9mWPFJwvuX7LDeNEVoflZuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603014; c=relaxed/simple;
	bh=7vn4dQJBGQl0lFehw1PR/AKawmNzG0YlZxiBfSY+xO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBDqtA5vAmPafhvd85YUnK6WUO6IZF0PJLyqlNJ3rvDhfLDTqAUsKLHy9URR6ORQDFs7fULtu2XvTL2qi97dRN3npv72Z6+jNQp6nFxODgPtNvXn3V+ZcUCLNWuHCAcgzCSZx3qT6xvGl5lolpxV7WkA6gbFyOtowjzRIFT3j9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CgzhhCJt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CgzhhCJt"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15B68558;
	Thu, 17 Sep 2026 01:55:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789602909;
	bh=7vn4dQJBGQl0lFehw1PR/AKawmNzG0YlZxiBfSY+xO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CgzhhCJt2CBYzKEZ7YaG2UCltcFrp7WrY52FfbY09OYUIrDHi/TIJIXQejXjDXqF/
	 2BM3cyQHHp5vnOdK/IkHExpriQZN47ZlCcyXcFPzEsCCWY8pWAPeJ0UCjVfVsC9qc6
	 HkN3sqGG72geKDeFifD39LeFOSoEroFINJlzxONk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>
Subject: [vsp-tests] [PATCH 1/4] Use lowercase for all shell script variables
Date: Thu, 17 Sep 2026 02:56:45 +0300
Message-ID: <20260916235648.261920-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235648.261920-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260916235648.261920-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vast majority of shell script variables are in lowercase, but a
handful still use uppercase. Use lowercase everywhere for consistency.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 scripts/bin2png.sh   | 12 ++++++------
 scripts/logger.sh    |  6 +++---
 scripts/vsp-tests.sh |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/bin2png.sh b/scripts/bin2png.sh
index e7b16ee6288b..e5cb01088687 100755
--- a/scripts/bin2png.sh
+++ b/scripts/bin2png.sh
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
 
-FILE=${1:-.}
+file=${1:-.}
 
 convert_image() {
 	local file=$1
@@ -29,14 +29,14 @@ convert_image() {
 	rm $ppm
 }
 
-if [ -d $FILE ] ; then
-	if [ $(ls $FILE/vsp-unit-test-00*-*frame*.bin 2>/dev/null | wc -l) != 0 ] ; then
-		for f in $FILE/vsp-unit-test-00*-*frame*.bin ; do
+if [ -d $file ] ; then
+	if [ $(ls $file/vsp-unit-test-00*-*frame*.bin 2>/dev/null | wc -l) != 0 ] ; then
+		for f in $file/vsp-unit-test-00*-*frame*.bin ; do
 			convert_image $f
 		done
 	fi
-elif [ -f $FILE ] ; then
-	convert_image $FILE
+elif [ -f $file ] ; then
+	convert_image $file
 else
 	echo "Usage: $0 <file or directory>"
 fi
diff --git a/scripts/logger.sh b/scripts/logger.sh
index 75426a51961a..fd9f5485c180 100755
--- a/scripts/logger.sh
+++ b/scripts/logger.sh
@@ -4,9 +4,9 @@
 
 label=${1:+ [$1]}
 
-TRACE_MARKER=/sys/kernel/debug/tracing/trace_marker
-if [ -e $TRACE_MARKER ] && [ "$(id -u)" = 0 ]; then
-	./monotonic-ts "$label" | tee -a $TRACE_MARKER
+trace_marker=/sys/kernel/debug/tracing/trace_marker
+if [ -e $trace_marker ] && [ "$(id -u)" = 0 ]; then
+	./monotonic-ts "$label" | tee -a $trace_marker
 else
 	./monotonic-ts "$label"
 fi
diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
index 13e7ba4410b5..765ec08273c3 100755
--- a/scripts/vsp-tests.sh
+++ b/scripts/vsp-tests.sh
@@ -18,7 +18,7 @@
 ##   n: Number of iterations to execute test suite
 ##
 
-KERNEL_VERSION=`uname -r`
+kernel_version=`uname -r`
 
 run_test() {
 	local script=$1
@@ -44,7 +44,7 @@ run_test() {
 	done
 
 	if [ $(ls *.bin 2>/dev/null | wc -l) != 0 ] ; then
-		local dir=$KERNEL_VERSION/test-$script/$iteration/
+		local dir=$kernel_version/test-$script/$iteration/
 
 		mkdir -p $dir
 		mv *.bin $dir
-- 
Regards,

Laurent Pinchart

