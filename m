Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A43C141A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 23:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603017; cv=none; b=sR7Ns1OqQboXGX6kBZljuqCG0mzyzPT3UrIudRgEJ9sRUcePTdS0rYNyfBX3/AQcdx5vMawQ8QUPMngVlA9yVCcAoJCFA0gyyOLqon7mJF4isbtyMeXD3xCooRm0ZqmUsnozy9zCbK7BkVhH5QwFo73vB6JSJG3Ey0iZJdCiH0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603017; c=relaxed/simple;
	bh=cGSjiKyy1sYFIeXlpLLWwvSCFqZHY6ErPiERS+E/FAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ttzzqk5y/vwOkaavhJBU38J2L2rz6hzksm2vymtp0ZiezC54R16l9fC3vVmnQrZgKSeUKmK7Fs2CiiN31jPtNmxSCAVvaGN4yD/Dbjr3HEB3sFbxx7oOjtb6y2bVCYXq66GZp6Wv+ogTJOpsP+4hH7eBHL50pJDxZjyAZN+6Kkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Kry3WQ5L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kry3WQ5L"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8722C51;
	Thu, 17 Sep 2026 01:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789602912;
	bh=cGSjiKyy1sYFIeXlpLLWwvSCFqZHY6ErPiERS+E/FAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kry3WQ5Lmw7WD2ShIaFDObO/UUwe1/GlnsJgk86mC1AHxzEUR2i6PBbsvbs8RrJNS
	 BBowJBN1cUuz4yt1E0Vg2jQA4hf6D/jIDrsETxoffwu4CyGnBYO/DbMu0rsgUoWerb
	 vFX7U/IQ+NSDOrgFQMok3Qf49mWUj45Iyluz+5K8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>
Subject: [vsp-tests] [PATCH 3/4] vsp-lib: Store logs in current directory
Date: Thu, 17 Sep 2026 02:56:47 +0300
Message-ID: <20260916235648.261920-4-laurent.pinchart+renesas@ideasonboard.com>
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

Now that the VSP test suite can be installed to system locations and run
from anywhere, it will store log files in the installation directory.
Fix this and store log files in the current directory instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 scripts/vsp-lib.sh | 47 ++++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index bda47f983ce4..576c4c43a659 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -106,16 +106,16 @@ vsp1_set_control() {
 	local subdev=$(vsp1_entity_subdev $entity)
 	local control=$($yavta --no-query -l $subdev | grep -- "$control_name" | cut -d ' ' -f 2)
 
-	echo "Setting control $control_name ($control) to $value" | $logger "$entity" >> $logfile
-	$yavta --no-query -w "$control $value" $subdev | $logger "$entity" >> $logfile
+	echo "Setting control $control_name ($control) to $value" | $logger "$entity" >> $log_file
+	$yavta --no-query -w "$control $value" $subdev | $logger "$entity" >> $log_file
 }
 
 vsp1_reset_controls() {
 	local entity=$1
 	local subdev=$(vsp1_entity_subdev $entity)
 
-	echo "Resetting controls on $subdev" | $logger "$entity" >> $logfile
-	$yavta --no-query --reset-controls $subdev | $logger "$entity" >> $logfile
+	echo "Resetting controls on $subdev" | $logger "$entity" >> $log_file
+	$yavta --no-query --reset-controls $subdev | $logger "$entity" >> $log_file
 }
 
 # -----------------------------------------------------------------------------
@@ -241,7 +241,7 @@ compare_frame_exact() {
 	local match='fail'
 	diff -q $img_a $img_b > /dev/null && match='pass'
 
-	echo "Compared $img_a and $img_b: $match" | $logger check >> $logfile
+	echo "Compared $img_a and $img_b: $match" | $logger check >> $log_file
 
 	if [ $match = 'pass' ] ; then
 		return 0
@@ -279,7 +279,7 @@ compare_frame_fuzzy() {
 	local ae_match=$(echo $ae $width $height | awk '{ if ($1 / $2 / $3 < 0.05) { print "pass" } else { print "fail" } }')
 	local mae_match=$(echo $mae | awk '{ if ($1 < 0.01) { print "pass" } else { print "fail" } }')
 
-	echo "Compared $img_a and $img_b: ae $ae ($ae_match) mae $mae ($mae_match)" | $logger check >> $logfile
+	echo "Compared $img_a and $img_b: ae $ae ($ae_match) mae $mae ($mae_match)" | $logger check >> $log_file
 
 	if [ $ae_match = 'pass' -a $mae_match = 'pass' ] ; then
 		return 0
@@ -324,14 +324,14 @@ compare_frames() {
 		}
 
 		if [ $match = "false" -o x$VSP_KEEP_FRAMES = x1 ] ; then
-			mv $frame ${0/.sh/}-$params-$(basename ${frame})
+			mv $frame ${log_prefix}-$params-$(basename ${frame})
 		fi
 	done
 
 	if [ x$VSP_KEEP_FRAMES = x1 -o $result = "fail" ] ; then
-		mv ${out_frames_dir}ref-frame.bin ${0/.sh/}-$params-ref-frame.bin
+		mv ${out_frames_dir}ref-frame.bin ${log_prefix}-$params-ref-frame.bin
 		for frame in ${out_frames_dir}rpf.*.bin ; do
-			mv $frame ${0/.sh/}-$params-$(basename ${frame})
+			mv $frame ${log_prefix}-$params-$(basename ${frame})
 		done
 	else
 		rm -f ${out_frames_dir}ref-frame.bin
@@ -349,7 +349,7 @@ compare_histogram() {
 	local match='fail'
 	diff -q $histo_a $histo_b > /dev/null && match='pass'
 
-	echo "Compared $histo_a and $histo_b: $match" | $logger check >> $logfile
+	echo "Compared $histo_a and $histo_b: $match" | $logger check >> $log_file
 
 	if [ $match = 'pass' ] ; then
 		return 0
@@ -372,13 +372,13 @@ compare_histograms() {
 	local result="pass"
 	for histo in ${out_frames_dir}histo-*.bin ; do
 		(compare_histogram $histo ${out_frames_dir}ref-histogram.bin) || {
-			mv $histo ${0/.sh/}-$(basename ${histo/.bin/-$fmt.bin}) ;
+			mv $histo ${log_prefix}-$(basename ${histo/.bin/-$fmt.bin}) ;
 			result="fail"
 		}
 	done
 
 	if [ $result = "fail" ] ; then
-		mv ${out_frames_dir}ref-histogram.bin ${0/.sh/}-ref-histogram-$fmt.bin
+		mv ${out_frames_dir}ref-histogram.bin ${log_prefix}-ref-histogram-$fmt.bin
 	else
 		rm -f ${out_frames_dir}ref-histogram.bin
 		rm -f ${out_frames_dir}histo-*.bin
@@ -987,7 +987,7 @@ vsp_runner() {
 
 	$yavta -c$count -n $buffers ${format:+-f $format} ${size:+-s $size} \
 		${skip:+--skip $skip} ${file:+--file=$file} ${pause:+-p$pause} \
-		$videodev | $logger $entity >> $logfile
+		$videodev | $logger $entity >> $log_file
 }
 
 vsp_runner_find() {
@@ -1051,12 +1051,15 @@ vsp_runner_resume() {
 #
 
 test_init() {
-	export logfile=${1/sh/log}
+	export log_prefix="vsp-tests-logs/$(basename ${1%.sh})"
+	export log_file="${log_prefix}.log"
+
 	local features=$2
 	local optional_features=$3
 
-	rm -f $logfile
-	rm -f ${1/.sh/}*.bin
+	mkdir -p "$(dirname $log_prefix)"
+	rm -f $log_file
+	rm -f $log_prefix/*.bin
 
 	local best_features_count=0
 	local best_mdev=
@@ -1097,21 +1100,21 @@ test_init() {
 	done
 
 	if [ -z $best_mdev ] ; then
-		echo "No device found with feature set \`$features'" | $logger config >> $logfile
+		echo "No device found with feature set \`$features'" | $logger config >> $log_file
 		echo "Test requires unavailable feature set \`$features': skip" >&2
 		exit 1
 	fi
 
 	mdev=$best_mdev
 	dev=$(vsp1_device $mdev)
-	echo "Using device $mdev ($dev)" | $logger config >> $logfile
+	echo "Using device $mdev ($dev)" | $logger config >> $log_file
 
 	# Reset any rotation or flipping controls
 	vsp1_reset_controls wpf.0
 }
 
 test_start() {
-	echo "Testing $1" | $logger >> $logfile
+	echo "Testing $1" | $logger >> $log_file
 	echo -n "Testing $1: " >&2
 
 	# Store the marker for the last line of the kernel log.
@@ -1119,11 +1122,11 @@ test_start() {
 }
 
 test_complete() {
-	echo "Done: $1" | $logger >> $logfile
+	echo "Done: $1" | $logger >> $log_file
 	echo $1 >&2
 
 	# Capture the part of the kernel log relative to the test.
-	dmesg | sed "1,/$marker/d" | $logger kernel >> $logfile
+	dmesg | sed "1,/$marker/d" | $logger kernel >> $log_file
 
 	rm -f ${out_frames_dir}frame-*.bin
 	rm -f ${out_frames_dir}histo-*.bin
@@ -1131,5 +1134,5 @@ test_complete() {
 }
 
 test_run() {
-	test_main | $logger error >> $logfile
+	test_main | $logger error >> $log_file
 }
-- 
Regards,

Laurent Pinchart

