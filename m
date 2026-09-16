Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3E4A1DFA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 23:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603018; cv=none; b=qKDt8+B9yw/GjmnhWsf6o6Gd3RhiejOwAAlGBvDZhB4CMdyoCW9eU5a1snS0ZA+oXh+xqJtHAqhKrMx3tAnWkHO24Jrtq2XDiJ1Z7VX6VGwDXjplbCUSj/EfnTC5+mtJTWz0qwv71AmIhm4DxC4rDgp+IzRFOk2mOeshXu8miUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603018; c=relaxed/simple;
	bh=i2qz7p7vzCRSg6cy0OBt/JSxk5y/0oFHEXAMUAarelE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQBc4Rw0p8LEjsDOD08I84nvruP9JhVUtykGrNC/fYuL1WskZzg8NDHgjmFhzTHEJQFCIsRWwnwxYU/4DJNxGoU6P1Et9MkwTaLr9X1cYPQ9dWJe04dovtwnYHflMILLYQB87WG1kNvsxJzNwoIp3n4OeZw8YHnS1pWSN+pSBoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G2WqHx2k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G2WqHx2k"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9105BB2D;
	Thu, 17 Sep 2026 01:55:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789602910;
	bh=i2qz7p7vzCRSg6cy0OBt/JSxk5y/0oFHEXAMUAarelE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G2WqHx2k789LrmEbj3NPaqvrIifcO4wsPHNoAeb46OYrnEJCED4Yvh/yMJ3W6Py36
	 +nSYTAHscqtEeC9nNVBQ7QhraBggUV5aQVcNp7I/tG0f2VJjyCKzqUu+URdRj3safV
	 YolspBH6DNS5fAxvTOkRRRfY8TvroA2ywmhEGCps=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>
Subject: [vsp-tests] [PATCH 2/4] Install in FHS-compatible locations
Date: Thu, 17 Sep 2026 02:56:46 +0300
Message-ID: <20260916235648.261920-3-laurent.pinchart+renesas@ideasonboard.com>
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

The VSP test suite was designed to be installed in a custom directory
and run manually from there, with no regard for standard directories
defined in the Filesystem Hierarchy Standard (FHS) specification. When
integrated as a package in frameworks such as Buildroot or Yocto, this
results in many files being installed directly in '/usr'.

Change the install locations to facilitate integration in distributions
and build systems in a fashion compliant with the FHS specification. The
vsp-tests runner is installed in bindir, all supporting scripts and
binaries in libexecdir, and data files in datadir.

The test suite can currently be copied manually to arbitrary directories
and run from there. This feature is deemed important to preserve, at
least during a transition period. To that end, ignore the meson bindir,
libexecdir and datadir options, and hardcode standard locations based on
the common prefix. This gives predictable relative paths between
components that can be hardcoded in scripts.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 data/frames/meson.build             |  6 ++-
 meson.build                         |  4 ++
 scripts/logger.sh                   |  5 +-
 scripts/meson.build                 |  6 +--
 scripts/vsp-lib.sh                  | 83 +++++++++++++++--------------
 scripts/{vsp-tests.sh => vsp-tests} | 10 ++--
 src/meson.build                     |  4 +-
 tests/meson.build                   |  2 +-
 tests/vsp-unit-test-0001.sh         |  2 +-
 tests/vsp-unit-test-0002.sh         |  2 +-
 tests/vsp-unit-test-0003.sh         |  2 +-
 tests/vsp-unit-test-0004.sh         |  2 +-
 tests/vsp-unit-test-0005.sh         |  2 +-
 tests/vsp-unit-test-0006.sh         |  2 +-
 tests/vsp-unit-test-0007.sh         |  2 +-
 tests/vsp-unit-test-0008.sh         |  2 +-
 tests/vsp-unit-test-0009.sh         |  2 +-
 tests/vsp-unit-test-0010.sh         |  2 +-
 tests/vsp-unit-test-0011.sh         |  2 +-
 tests/vsp-unit-test-0012.sh         |  2 +-
 tests/vsp-unit-test-0013.sh         |  2 +-
 tests/vsp-unit-test-0014.sh         |  2 +-
 tests/vsp-unit-test-0015.sh         |  2 +-
 tests/vsp-unit-test-0016.sh         |  2 +-
 tests/vsp-unit-test-0017.sh         |  2 +-
 tests/vsp-unit-test-0018.sh         |  2 +-
 tests/vsp-unit-test-0019.sh         |  2 +-
 tests/vsp-unit-test-0020.sh         |  2 +-
 tests/vsp-unit-test-0021.sh         |  2 +-
 tests/vsp-unit-test-0022.sh         |  2 +-
 tests/vsp-unit-test-0023.sh         |  2 +-
 tests/vsp-unit-test-0024.sh         |  2 +-
 tests/vsp-unit-test-0025.sh         |  2 +-
 tests/vsp-unit-test-0026.sh         |  2 +-
 tests/vsp-unit-test-0027.sh         |  2 +-
 35 files changed, 93 insertions(+), 81 deletions(-)
 rename scripts/{vsp-tests.sh => vsp-tests} (82%)

diff --git a/data/frames/meson.build b/data/frames/meson.build
index a9d79f29cde3..4df6abf3c269 100644
--- a/data/frames/meson.build
+++ b/data/frames/meson.build
@@ -12,12 +12,14 @@ tables = [
     ['lut', 'zero'],
 ]
 
+frames_dir = datadir / 'frames'
+
 foreach table : tables
     name = '@0@-@1@.bin'.format(table[0], table[1])
     custom_target(output : name,
                   command : [gen_lut, '-o', '@OUTPUT@', '-t', table[0], table[1]],
                   install : true,
-                  install_dir : 'frames')
+                  install_dir : frames_dir)
 endforeach
 
 custom_target(input : files('frame-reference-1024x768.ppm.gz'),
@@ -25,4 +27,4 @@ custom_target(input : files('frame-reference-1024x768.ppm.gz'),
               capture : true,
               command : [gzip, '-cd', '@INPUT@'],
               install : true,
-              install_dir : 'frames')
+              install_dir : frames_dir)
diff --git a/meson.build b/meson.build
index 026bc0d29187..5ac2f4c44d89 100644
--- a/meson.build
+++ b/meson.build
@@ -30,6 +30,10 @@ endif
 
 add_project_arguments(cc_arguments, language : 'c')
 
+bindir = get_option('prefix') / 'bin'
+datadir = get_option('prefix') / 'share' / 'vsp-tests'
+libexecdir = get_option('prefix') / 'libexec' / 'vsp-tests'
+
 subdir('data')
 subdir('scripts')
 subdir('src')
diff --git a/scripts/logger.sh b/scripts/logger.sh
index fd9f5485c180..be59462fd7a4 100755
--- a/scripts/logger.sh
+++ b/scripts/logger.sh
@@ -3,10 +3,11 @@
 # SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
 
 label=${1:+ [$1]}
+ts=$(dirname "$0")/monotonic-ts
 
 trace_marker=/sys/kernel/debug/tracing/trace_marker
 if [ -e $trace_marker ] && [ "$(id -u)" = 0 ]; then
-	./monotonic-ts "$label" | tee -a $trace_marker
+	$ts "$label" | tee -a $trace_marker
 else
-	./monotonic-ts "$label"
+	$ts "$label"
 fi
diff --git a/scripts/meson.build b/scripts/meson.build
index a86f1a568f6b..f29a7e988431 100644
--- a/scripts/meson.build
+++ b/scripts/meson.build
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: CC0-1.0
 
-scripts = files([
+helper_scripts = files([
     'bin2png.sh',
     'histo2png.py',
     'logger.sh',
     'vsp-lib.sh',
-    'vsp-tests.sh',
 ])
 
-install_data(scripts, install_dir : get_option('prefix'))
+install_data(helper_scripts, install_dir : libexecdir)
+install_data('vsp-tests', install_dir : bindir)
diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index c8f21c60741c..bda47f983ce4 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -2,10 +2,13 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
 
-genimage='./gen-image'
+genimage="$(dirname "$0")/gen-image"
+logger="$(dirname "$0")/logger.sh"
 mediactl='media-ctl'
 yavta='yavta'
-frames_dir=/tmp/
+
+in_frames_dir="$(dirname "$0")/../../share/vsp-tests/frames"
+out_frames_dir='/tmp/'
 
 # ------------------------------------------------------------------------------
 # Miscellaneous
@@ -103,16 +106,16 @@ vsp1_set_control() {
 	local subdev=$(vsp1_entity_subdev $entity)
 	local control=$($yavta --no-query -l $subdev | grep -- "$control_name" | cut -d ' ' -f 2)
 
-	echo "Setting control $control_name ($control) to $value" | ./logger.sh "$entity" >> $logfile
-	$yavta --no-query -w "$control $value" $subdev | ./logger.sh "$entity" >> $logfile
+	echo "Setting control $control_name ($control) to $value" | $logger "$entity" >> $logfile
+	$yavta --no-query -w "$control $value" $subdev | $logger "$entity" >> $logfile
 }
 
 vsp1_reset_controls() {
 	local entity=$1
 	local subdev=$(vsp1_entity_subdev $entity)
 
-	echo "Resetting controls on $subdev" | ./logger.sh "$entity" >> $logfile
-	$yavta --no-query --reset-controls $subdev | ./logger.sh "$entity" >> $logfile
+	echo "Resetting controls on $subdev" | $logger "$entity" >> $logfile
+	$yavta --no-query --reset-controls $subdev | $logger "$entity" >> $logfile
 }
 
 # -----------------------------------------------------------------------------
@@ -207,7 +210,7 @@ reference_frame() {
 	[ x$__vsp_brx_inputs != x ] && options="$options -c $__vsp_brx_inputs"
 
 	$genimage -i $in_format -f $out_format -s $size -a $alpha $options -o $file \
-		frames/frame-reference-1024x768.ppm
+		${in_frames_dir}/frame-reference-1024x768.ppm
 }
 
 reference_histogram() {
@@ -221,7 +224,7 @@ reference_histogram() {
 	[[ "x$hgt_hue_areas" != x ]] && hue="--histogram-areas $hgt_hue_areas"
 
 	$genimage -i $format -f $format -s $size -H $file --histogram-type $type $hue \
-		frames/frame-reference-1024x768.ppm
+		${in_frames_dir}/frame-reference-1024x768.ppm
 }
 
 # ------------------------------------------------------------------------------
@@ -238,7 +241,7 @@ compare_frame_exact() {
 	local match='fail'
 	diff -q $img_a $img_b > /dev/null && match='pass'
 
-	echo "Compared $img_a and $img_b: $match" | ./logger.sh check >> $logfile
+	echo "Compared $img_a and $img_b: $match" | $logger check >> $logfile
 
 	if [ $match = 'pass' ] ; then
 		return 0
@@ -276,7 +279,7 @@ compare_frame_fuzzy() {
 	local ae_match=$(echo $ae $width $height | awk '{ if ($1 / $2 / $3 < 0.05) { print "pass" } else { print "fail" } }')
 	local mae_match=$(echo $mae | awk '{ if ($1 < 0.01) { print "pass" } else { print "fail" } }')
 
-	echo "Compared $img_a and $img_b: ae $ae ($ae_match) mae $mae ($mae_match)" | ./logger.sh check >> $logfile
+	echo "Compared $img_a and $img_b: ae $ae ($ae_match) mae $mae ($mae_match)" | $logger check >> $logfile
 
 	if [ $ae_match = 'pass' -a $mae_match = 'pass' ] ; then
 		return 0
@@ -296,7 +299,7 @@ compare_frames() {
 	local out_fmt=$(echo $out_format | tr '[:upper:]' '[:lower:]')
 	local size=$(vsp1_entity_get_size wpf.$wpf 1)
 
-	reference_frame ${frames_dir}ref-frame.bin $in_format $out_format $size $args
+	reference_frame ${out_frames_dir}ref-frame.bin $in_format $out_format $size $args
 
 	local method=exact
 	local result="pass"
@@ -312,10 +315,10 @@ compare_frames() {
 		method=fuzzy
 	fi
 
-	for frame in ${frames_dir}frame-*.bin ; do
+	for frame in ${out_frames_dir}frame-*.bin ; do
 		local match="true"
 
-		(compare_frame_$method $out_format $size $frame ${frames_dir}ref-frame.bin) ||  {
+		(compare_frame_$method $out_format $size $frame ${out_frames_dir}ref-frame.bin) ||  {
 			match="false" ;
 			result="fail" ;
 		}
@@ -326,14 +329,14 @@ compare_frames() {
 	done
 
 	if [ x$VSP_KEEP_FRAMES = x1 -o $result = "fail" ] ; then
-		mv ${frames_dir}ref-frame.bin ${0/.sh/}-$params-ref-frame.bin
-		for frame in ${frames_dir}rpf.*.bin ; do
+		mv ${out_frames_dir}ref-frame.bin ${0/.sh/}-$params-ref-frame.bin
+		for frame in ${out_frames_dir}rpf.*.bin ; do
 			mv $frame ${0/.sh/}-$params-$(basename ${frame})
 		done
 	else
-		rm -f ${frames_dir}ref-frame.bin
-		rm -f ${frames_dir}frame-*.bin
-		rm -f ${frames_dir}rpf.*.bin
+		rm -f ${out_frames_dir}ref-frame.bin
+		rm -f ${out_frames_dir}frame-*.bin
+		rm -f ${out_frames_dir}rpf.*.bin
 	fi
 
 	echo $result
@@ -346,7 +349,7 @@ compare_histogram() {
 	local match='fail'
 	diff -q $histo_a $histo_b > /dev/null && match='pass'
 
-	echo "Compared $histo_a and $histo_b: $match" | ./logger.sh check >> $logfile
+	echo "Compared $histo_a and $histo_b: $match" | $logger check >> $logfile
 
 	if [ $match = 'pass' ] ; then
 		return 0
@@ -364,21 +367,21 @@ compare_histograms() {
 	local fmt=$(echo $format | tr '[:upper:]' '[:lower:]')
 	local size=$(vsp1_entity_get_size wpf.$wpf 1)
 
-	reference_histogram ${frames_dir}ref-histogram.bin $format $size $type $hgt_hue_areas
+	reference_histogram ${out_frames_dir}ref-histogram.bin $format $size $type $hgt_hue_areas
 
 	local result="pass"
-	for histo in ${frames_dir}histo-*.bin ; do
-		(compare_histogram $histo ${frames_dir}ref-histogram.bin) || {
+	for histo in ${out_frames_dir}histo-*.bin ; do
+		(compare_histogram $histo ${out_frames_dir}ref-histogram.bin) || {
 			mv $histo ${0/.sh/}-$(basename ${histo/.bin/-$fmt.bin}) ;
 			result="fail"
 		}
 	done
 
 	if [ $result = "fail" ] ; then
-		mv ${frames_dir}ref-histogram.bin ${0/.sh/}-ref-histogram-$fmt.bin
+		mv ${out_frames_dir}ref-histogram.bin ${0/.sh/}-ref-histogram-$fmt.bin
 	else
-		rm -f ${frames_dir}ref-histogram.bin
-		rm -f ${frames_dir}histo-*.bin
+		rm -f ${out_frames_dir}ref-histogram.bin
+		rm -f ${out_frames_dir}histo-*.bin
 	fi
 
 	echo $result
@@ -911,7 +914,7 @@ generate_input_frame() {
 	$(format_v4l2_is_yuv $format) && options="$options -C -i YUV444M"
 
 	$genimage -f $format -s $size -a $alpha $options -o $file \
-		frames/frame-reference-1024x768.ppm
+		${in_frames_dir}/frame-reference-1024x768.ppm
 }
 
 vsp_runner() {
@@ -956,13 +959,13 @@ vsp_runner() {
 	case $entity in
 	hgo)
 		videodev=$(vsp1_entity_subdev "hgo histo")
-		file="${frames_dir}histo-#.bin"
+		file="${out_frames_dir}histo-#.bin"
 		buffers=10
 		;;
 
 	hgt)
 		videodev=$(vsp1_entity_subdev "hgt histo")
-		file="${frames_dir}histo-#.bin"
+		file="${out_frames_dir}histo-#.bin"
 		buffers=10
 		;;
 
@@ -970,7 +973,7 @@ vsp_runner() {
 		videodev=$(vsp1_entity_subdev "$entity input")
 		format=$__vsp_rpf_format
 		size=$(vsp1_entity_get_size $entity 0)
-		file=${frames_dir}${entity}.bin
+		file=${out_frames_dir}${entity}.bin
 		generate_input_frame $file $format $size
 		;;
 
@@ -978,13 +981,13 @@ vsp_runner() {
 		videodev=$(vsp1_entity_subdev "$entity output")
 		format=$__vsp_wpf_format
 		size=$(vsp1_entity_get_size $entity 1)
-		file="${frames_dir}frame-#.bin"
+		file="${out_frames_dir}frame-#.bin"
 		;;
 	esac
 
 	$yavta -c$count -n $buffers ${format:+-f $format} ${size:+-s $size} \
 		${skip:+--skip $skip} ${file:+--file=$file} ${pause:+-p$pause} \
-		$videodev | ./logger.sh $entity >> $logfile
+		$videodev | $logger $entity >> $logfile
 }
 
 vsp_runner_find() {
@@ -1094,21 +1097,21 @@ test_init() {
 	done
 
 	if [ -z $best_mdev ] ; then
-		echo "No device found with feature set \`$features'" | ./logger.sh config >> $logfile
+		echo "No device found with feature set \`$features'" | $logger config >> $logfile
 		echo "Test requires unavailable feature set \`$features': skip" >&2
 		exit 1
 	fi
 
 	mdev=$best_mdev
 	dev=$(vsp1_device $mdev)
-	echo "Using device $mdev ($dev)" | ./logger.sh config >> $logfile
+	echo "Using device $mdev ($dev)" | $logger config >> $logfile
 
 	# Reset any rotation or flipping controls
 	vsp1_reset_controls wpf.0
 }
 
 test_start() {
-	echo "Testing $1" | ./logger.sh >> $logfile
+	echo "Testing $1" | $logger >> $logfile
 	echo -n "Testing $1: " >&2
 
 	# Store the marker for the last line of the kernel log.
@@ -1116,17 +1119,17 @@ test_start() {
 }
 
 test_complete() {
-	echo "Done: $1" | ./logger.sh >> $logfile
+	echo "Done: $1" | $logger >> $logfile
 	echo $1 >&2
 
 	# Capture the part of the kernel log relative to the test.
-	dmesg | sed "1,/$marker/d" | ./logger.sh kernel >> $logfile
+	dmesg | sed "1,/$marker/d" | $logger kernel >> $logfile
 
-	rm -f ${frames_dir}frame-*.bin
-	rm -f ${frames_dir}histo-*.bin
-	rm -f ${frames_dir}rpf.*.bin
+	rm -f ${out_frames_dir}frame-*.bin
+	rm -f ${out_frames_dir}histo-*.bin
+	rm -f ${out_frames_dir}rpf.*.bin
 }
 
 test_run() {
-	test_main | ./logger.sh error >> $logfile
+	test_main | $logger error >> $logfile
 }
diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests
similarity index 82%
rename from scripts/vsp-tests.sh
rename to scripts/vsp-tests
index 765ec08273c3..022477e35b3a 100755
--- a/scripts/vsp-tests.sh
+++ b/scripts/vsp-tests
@@ -19,15 +19,17 @@
 ##
 
 kernel_version=`uname -r`
+libexec_dir=$(dirname "$0")/../libexec
 
 run_test() {
 	local script=$1
+	local script_name=$(basename $script)
 	local iteration=$2
 	local IFS="$(printf '\n\t')"
 
-	echo "- $script"
+	echo "- $script_name"
 
-	local output=$(./$script 2>&1 | tee /proc/self/fd/2)
+	local output=$($script 2>&1 | tee /proc/self/fd/2)
 	for line in $output ; do
 		local pass=0
 		local fail=0
@@ -44,7 +46,7 @@ run_test() {
 	done
 
 	if [ $(ls *.bin 2>/dev/null | wc -l) != 0 ] ; then
-		local dir=$kernel_version/test-$script/$iteration/
+		local dir=$kernel_version/test-$script_name/$iteration/
 
 		mkdir -p $dir
 		mv *.bin $dir
@@ -59,7 +61,7 @@ run_suite() {
 	num_skip=0
 	num_test=0
 
-	for test in vsp-unit-test*.sh; do
+	for test in ${libexec_dir}/vsp-tests/vsp-unit-test*.sh; do
 		run_test $test $1
 	done;
 
diff --git a/src/meson.build b/src/meson.build
index 3a6118bd3ea8..8842444a0274 100644
--- a/src/meson.build
+++ b/src/meson.build
@@ -13,9 +13,9 @@ m_dep = cc.find_library('m', required : false)
 executable('gen-image', gen_image_sources,
            dependencies : [m_dep],
            install : true,
-           install_dir : '')
+           install_dir : libexecdir)
 
 executable('monotonic-ts', monotonic_ts_sources,
            dependencies : [m_dep],
            install : true,
-           install_dir : '')
+           install_dir : libexecdir)
diff --git a/tests/meson.build b/tests/meson.build
index e5396cc0a132..b45b6a37a3ea 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -31,4 +31,4 @@ tests = files([
     'vsp-unit-test-0027.sh',
 ])
 
-install_data(tests, install_dir : get_option('prefix'))
+install_data(tests, install_dir : libexecdir)
diff --git a/tests/vsp-unit-test-0001.sh b/tests/vsp-unit-test-0001.sh
index 6e91ca665473..74fce15fc25d 100755
--- a/tests/vsp-unit-test-0001.sh
+++ b/tests/vsp-unit-test-0001.sh
@@ -8,7 +8,7 @@
 # by the WPF.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 formats="RGB332 ARGB555 XRGB555 RGB565 BGR24 RGB24 ABGR32 ARGB32 XBGR32 XRGB32"
diff --git a/tests/vsp-unit-test-0002.sh b/tests/vsp-unit-test-0002.sh
index 65af446220fd..2a01d199e6f4 100755
--- a/tests/vsp-unit-test-0002.sh
+++ b/tests/vsp-unit-test-0002.sh
@@ -8,7 +8,7 @@
 # by the WPF.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 formats="NV12M NV16M NV21M NV61M UYVY VYUY YUV420M YUV422M YUV444M YVU420M YVU422M YVU444M YUYV YVYU"
diff --git a/tests/vsp-unit-test-0003.sh b/tests/vsp-unit-test-0003.sh
index 0c83bdccd436..e13c84c1584b 100755
--- a/tests/vsp-unit-test-0003.sh
+++ b/tests/vsp-unit-test-0003.sh
@@ -7,7 +7,7 @@
 # pipeline with identical input and output formats.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 uds wpf.0"
 formats="RGB24 YUV444M"
diff --git a/tests/vsp-unit-test-0004.sh b/tests/vsp-unit-test-0004.sh
index 1f064def49f6..bc34005f7e41 100755
--- a/tests/vsp-unit-test-0004.sh
+++ b/tests/vsp-unit-test-0004.sh
@@ -7,7 +7,7 @@
 # up at the RPF output.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="hgo rpf.0 wpf.0"
 formats="RGB24 YUV444M"
diff --git a/tests/vsp-unit-test-0005.sh b/tests/vsp-unit-test-0005.sh
index a132cbfd9da4..1077a1d92f06 100755
--- a/tests/vsp-unit-test-0005.sh
+++ b/tests/vsp-unit-test-0005.sh
@@ -7,7 +7,7 @@
 # much, use RGB24 to simplify frame comparison.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 rpf.1 wpf.0"
 optional_features="rpf.2 rpf.3 rpf.4"
diff --git a/tests/vsp-unit-test-0006.sh b/tests/vsp-unit-test-0006.sh
index 1191e2643ca5..302436f161b5 100755
--- a/tests/vsp-unit-test-0006.sh
+++ b/tests/vsp-unit-test-0006.sh
@@ -6,7 +6,7 @@
 # Test invalid pipelines, without an RPF or without a WPF.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 format=RGB24
diff --git a/tests/vsp-unit-test-0007.sh b/tests/vsp-unit-test-0007.sh
index 2d96e3ba53e7..aafa03331768 100755
--- a/tests/vsp-unit-test-0007.sh
+++ b/tests/vsp-unit-test-0007.sh
@@ -6,7 +6,7 @@
 # Test composition through the BRU in RGB and YUV formats.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 rpf.1 bru wpf.0"
 formats="RGB24 YUV444M"
diff --git a/tests/vsp-unit-test-0008.sh b/tests/vsp-unit-test-0008.sh
index 7532d114fc00..96d5fc9921ce 100755
--- a/tests/vsp-unit-test-0008.sh
+++ b/tests/vsp-unit-test-0008.sh
@@ -7,7 +7,7 @@
 # the pipeline, both before and after the scaler.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="bru rpf.0 uds wpf.0"
 formats="RGB24 YUV444M"
diff --git a/tests/vsp-unit-test-0009.sh b/tests/vsp-unit-test-0009.sh
index 8fa2014f6d59..dbc71caa94a9 100755
--- a/tests/vsp-unit-test-0009.sh
+++ b/tests/vsp-unit-test-0009.sh
@@ -7,7 +7,7 @@
 # much, use RGB24 to simplify frame comparison.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0 wpf.1"
 optional_features="wpf.1 wpf.2 wpf.3"
diff --git a/tests/vsp-unit-test-0010.sh b/tests/vsp-unit-test-0010.sh
index 1486fb871eaa..1878e6a809c2 100755
--- a/tests/vsp-unit-test-0010.sh
+++ b/tests/vsp-unit-test-0010.sh
@@ -7,7 +7,7 @@
 # RPF -> LUT -> WPF pipelines with identical input and output formats.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 clu lut wpf.0"
 formats="RGB24 YUV444M"
diff --git a/tests/vsp-unit-test-0011.sh b/tests/vsp-unit-test-0011.sh
index ada878c1cdb7..53e1fd534e67 100755
--- a/tests/vsp-unit-test-0011.sh
+++ b/tests/vsp-unit-test-0011.sh
@@ -6,7 +6,7 @@
 # Test all combinations of horizontal flip, vertical flip and rotation on WPF.0.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0 wpf.0[control:'Vertical+Flip']"
 optional_features="wpf.0[control:'Horizontal+Flip'] wpf.0[control:'Rotate']"
diff --git a/tests/vsp-unit-test-0012.sh b/tests/vsp-unit-test-0012.sh
index ac9a38ec6233..5bf9c22a4fd6 100755
--- a/tests/vsp-unit-test-0012.sh
+++ b/tests/vsp-unit-test-0012.sh
@@ -6,7 +6,7 @@
 # Test runtime modification of horizontal and vertical flipping on WPF.0.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0 wpf.0[control:'Vertical+Flip']"
 optional_features="wpf.0[control:'Horizontal+Flip']"
diff --git a/tests/vsp-unit-test-0013.sh b/tests/vsp-unit-test-0013.sh
index 9faf5817d607..e9f15a0a3034 100755
--- a/tests/vsp-unit-test-0013.sh
+++ b/tests/vsp-unit-test-0013.sh
@@ -8,7 +8,7 @@
 # by the RPF.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 formats="RGB332 ARGB555 XRGB555 RGB565 BGR24 RGB24 ABGR32 ARGB32 XBGR32 XRGB32"
diff --git a/tests/vsp-unit-test-0014.sh b/tests/vsp-unit-test-0014.sh
index 4d749d78da59..f3ce87492a26 100755
--- a/tests/vsp-unit-test-0014.sh
+++ b/tests/vsp-unit-test-0014.sh
@@ -8,7 +8,7 @@
 # by the RPF.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 formats="NV12M NV16M NV21M NV61M UYVY VYUY YUV420M YUV422M YUV444M YVU420M YVU422M YVU444M YUYV YVYU"
diff --git a/tests/vsp-unit-test-0015.sh b/tests/vsp-unit-test-0015.sh
index 727874291710..9605eb192d63 100755
--- a/tests/vsp-unit-test-0015.sh
+++ b/tests/vsp-unit-test-0015.sh
@@ -10,7 +10,7 @@
 # carefully before putting it into practical use.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 sru wpf.0"
 formats="RGB24 YUV444M"
diff --git a/tests/vsp-unit-test-0016.sh b/tests/vsp-unit-test-0016.sh
index 89379634d584..8c9e860fb1f9 100755
--- a/tests/vsp-unit-test-0016.sh
+++ b/tests/vsp-unit-test-0016.sh
@@ -7,7 +7,7 @@
 # with image partitioning by inserting a UDS in the pipeline.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 uds wpf.0 wpf.0[control:'Vertical+Flip']"
 optional_features="wpf.0[control:'Horizontal+Flip'] wpf.0[control:'Rotate']"
diff --git a/tests/vsp-unit-test-0017.sh b/tests/vsp-unit-test-0017.sh
index 037e2ba300b1..a9219568696f 100755
--- a/tests/vsp-unit-test-0017.sh
+++ b/tests/vsp-unit-test-0017.sh
@@ -11,7 +11,7 @@
 # formats on the input and output.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 hst wpf.0"
 formats="HSV24 HSV32"
diff --git a/tests/vsp-unit-test-0018.sh b/tests/vsp-unit-test-0018.sh
index 77cf936770d2..faff3ac68973 100755
--- a/tests/vsp-unit-test-0018.sh
+++ b/tests/vsp-unit-test-0018.sh
@@ -7,7 +7,7 @@
 # cropping windows.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 crops="(0,0)/512x384 (32,32)/512x384 (32,64)/512x384 (64,32)/512x384"
diff --git a/tests/vsp-unit-test-0019.sh b/tests/vsp-unit-test-0019.sh
index 06d233992980..45e7b4775474 100755
--- a/tests/vsp-unit-test-0019.sh
+++ b/tests/vsp-unit-test-0019.sh
@@ -13,7 +13,7 @@
 # test can be easily extended to try further formats if needed in the future.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 
diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.sh
index c322da585eb1..055a5d7d8b64 100755
--- a/tests/vsp-unit-test-0020.sh
+++ b/tests/vsp-unit-test-0020.sh
@@ -10,7 +10,7 @@
 # still successful even with a suspend resume cycle in the middle of the test.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 
diff --git a/tests/vsp-unit-test-0021.sh b/tests/vsp-unit-test-0021.sh
index df4a4a452598..72f96fa29a7b 100755
--- a/tests/vsp-unit-test-0021.sh
+++ b/tests/vsp-unit-test-0021.sh
@@ -10,7 +10,7 @@
 # by the WPF.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 formats="RGB332 ARGB555 XRGB555 RGB565 BGR24 RGB24 ABGR32 ARGB32 XBGR32 XRGB32"
diff --git a/tests/vsp-unit-test-0022.sh b/tests/vsp-unit-test-0022.sh
index dc1e6986650c..ea376a394cb9 100755
--- a/tests/vsp-unit-test-0022.sh
+++ b/tests/vsp-unit-test-0022.sh
@@ -9,7 +9,7 @@
 # duration pipeline lifetime while we stress the system.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 
diff --git a/tests/vsp-unit-test-0023.sh b/tests/vsp-unit-test-0023.sh
index 1eff34ef40b6..735e6cbbe843 100755
--- a/tests/vsp-unit-test-0023.sh
+++ b/tests/vsp-unit-test-0023.sh
@@ -7,7 +7,7 @@
 # with the HGT hooked up at the HST output.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="hgt hsi hst rpf.0 wpf.0"
 
diff --git a/tests/vsp-unit-test-0024.sh b/tests/vsp-unit-test-0024.sh
index d9b70b11225e..f855913572e0 100755
--- a/tests/vsp-unit-test-0024.sh
+++ b/tests/vsp-unit-test-0024.sh
@@ -6,7 +6,7 @@
 # Test composition through the BRS in RGB and YUV formats.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 rpf.1 brs wpf.0"
 formats="RGB24 YUV444M"
diff --git a/tests/vsp-unit-test-0025.sh b/tests/vsp-unit-test-0025.sh
index db10ebe3f4b6..16892e911faa 100755
--- a/tests/vsp-unit-test-0025.sh
+++ b/tests/vsp-unit-test-0025.sh
@@ -7,7 +7,7 @@
 # pipeline with identical input and output formats to generate our output.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 uds wpf.0"
 formats="RGB24 ARGB32"
diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
index 36ed0b03469b..7cf120c65127 100755
--- a/tests/vsp-unit-test-0026.sh
+++ b/tests/vsp-unit-test-0026.sh
@@ -7,7 +7,7 @@
 # copy test to validate the hardware afterwards.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 
diff --git a/tests/vsp-unit-test-0027.sh b/tests/vsp-unit-test-0027.sh
index 8be8ae736375..4231a9d3a2aa 100755
--- a/tests/vsp-unit-test-0027.sh
+++ b/tests/vsp-unit-test-0027.sh
@@ -8,7 +8,7 @@
 # windows.
 #
 
-. ./vsp-lib.sh
+. $(dirname "$0")/vsp-lib.sh
 
 features="rpf.0 wpf.0"
 crops="(0,0)/512x384 (32,32)/512x384 (32,64)/512x384 (64,32)/512x384"
-- 
Regards,

Laurent Pinchart

