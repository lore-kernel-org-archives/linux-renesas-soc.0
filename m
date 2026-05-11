Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8F377003
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502170; cv=none; b=JmLScoDy5W+4lkzNFw3XE/VHZzCh2E6gRmSIdlFHOsymVfbsFsaTpr7fMMF7NgX+1QJ1vOiyH0AYEi9cNprF39iWr2bBB0Zci0QXpD6cSofvGRnf0zCo2hOvSk6+OEQ6fJZXQza41g6xYdoxn2xsPJavAm7VGUiwuqhE8XpBHp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502170; c=relaxed/simple;
	bh=C/dZNxPdMh+24TYAdoIVjUXIrPBtYiIlOpn+geX+Jhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbXNnhyQ037A2SGsDIfxpjS3xCptJVNIxTkx21pu8AZ240B4zeD0s2ZFBuUSn7B175rft6+edoxZATHrLsqHoLxT/L3ijAgqllEM1NyKUK4AUltUylCM5iHJQrJkvEGU9Iul1iL0oZTFaL6dBBshyHQZRm7LtFLKKTdUJ5CWrLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RrnvY2hf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RrnvY2hf"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C03DA9D1;
	Mon, 11 May 2026 14:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778502154;
	bh=C/dZNxPdMh+24TYAdoIVjUXIrPBtYiIlOpn+geX+Jhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RrnvY2hfbPCUjU/4arQPlaGtQPxfX46MIPaWZuoDnHLWeZfffV2L1raCjNzxTZi4x
	 SICoOtKq5NtPS4oulYrotnmot9xnsOqmxoxXeZqqsRwhlRDEaS3jKHNzzcEbuY2TDr
	 pWwSmGpkr8OwfbTq2lA3MmsddPFtnh7wSXFT742w=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-test] [PATCH v1 1/5] Convert to meson
Date: Mon, 11 May 2026 15:22:33 +0300
Message-ID: <20260511122237.3084426-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
References: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Meson is a modern build system that simplifies cross-compilation.
Let make retire after a long career.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .gitignore        |  3 +++
 Makefile          | 14 --------------
 README            |  4 +++-
 crc/Makefile      | 32 --------------------------------
 crc/meson.build   | 22 ++++++++++++++++++++++
 meson.build       | 24 ++++++++++++++++++++++++
 tests/Makefile    | 10 ----------
 tests/meson.build | 21 +++++++++++++++++++++
 8 files changed, 73 insertions(+), 57 deletions(-)
 create mode 100644 .gitignore
 delete mode 100644 Makefile
 delete mode 100644 crc/Makefile
 create mode 100644 crc/meson.build
 create mode 100644 meson.build
 delete mode 100644 tests/Makefile
 create mode 100644 tests/meson.build

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 000000000000..54472dda1bcd
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: CC0-1.0
+
+build/
diff --git a/Makefile b/Makefile
deleted file mode 100644
index e9c0edb785e7..000000000000
--- a/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-
-SUBDIRS=crc tests
-
-recursive=all clean install
-
-all:
-
-$(recursive):
-	@target=$@ ; \
-	for subdir in $(SUBDIRS); do \
-		echo "Making $$target in $$subdir" ; \
-		$(MAKE) -C $$subdir $$target; \
-	done
diff --git a/README b/README
index dcd34611d820..1b911380dd4b 100644
--- a/README
+++ b/README
@@ -19,7 +19,9 @@ Building and Installing
 The du-tests suite is written in Python and doesn't have any build time
 dependency. To install it, run
 
-	make install INSTALL_DIR=/path/to/target/directory
+	meson setup build/ .
+	meson compile -C build
+	meson install -C build --destdir /path/to/target/directory
 
 This will copy the test scripts to the target directory to be copied or
 exported to the host.
diff --git a/crc/Makefile b/crc/Makefile
deleted file mode 100644
index 0922163da31b..000000000000
--- a/crc/Makefile
+++ /dev/null
@@ -1,32 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-
-CROSS_COMPILE ?=
-
-CC	:= $(CROSS_COMPILE)gcc
-CFLAGS	?= -O2 -W -Wall -Wno-unused-parameter -Iinclude
-LDFLAGS	?=
-LIBS	:=
-
-OUTPUT	:= discom-crc
-OBJECTS	:= main.o
-
-%.o : %.c
-	$(CC) $(CFLAGS) -c -o $@ $<
-
-all: $(OUTPUT)
-
-$(OUTPUT): $(OBJECTS)
-	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
-
-crc.c : gen-crc.py
-	./$< $@
-
-main.o : crc.c
-
-clean:
-	-rm -f *.o
-	-rm -f crc.c
-	-rm -f $(OUTPUT)
-
-install:
-	cp $(OUTPUT) $(INSTALL_DIR)/
diff --git a/crc/meson.build b/crc/meson.build
new file mode 100644
index 000000000000..6b3b49031fa3
--- /dev/null
+++ b/crc/meson.build
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: CC0-1.0
+
+discom_crc_sources = files([
+    'main.c',
+])
+
+gen_crc = files('gen-crc.py')
+
+crc = custom_target(
+    output : 'crc.c',
+    command : [gen_crc, '@OUTPUT@']
+)
+
+crc_lib = static_library(
+    'crc',
+    crc,
+    c_args : ['-include', 'stdint.h'],
+)
+
+executable('discom-crc', discom_crc_sources,
+           link_with : [crc_lib],
+           install : true)
diff --git a/meson.build b/meson.build
new file mode 100644
index 000000000000..fa8a36a921b5
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: CC0-1.0
+
+project('kms-tests', 'c',
+    meson_version : '>= 0.60',
+    version : '0.0.0',
+    default_options : [
+        'werror=true',
+        'warning_level=2',
+    ],
+    license : 'GPL 2.0+')
+
+#
+# Configure the build environment
+#
+cc = meson.get_compiler('c')
+
+cc_arguments = [
+    '-Wno-unused-parameter',
+]
+
+add_project_arguments(cc_arguments, language : 'c')
+
+subdir('crc')
+subdir('tests')
diff --git a/tests/Makefile b/tests/Makefile
deleted file mode 100644
index 0a921e5f56cd..000000000000
--- a/tests/Makefile
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-
-SCRIPTS=$(wildcard *.py)
-
-all:
-
-clean:
-
-install:
-	cp $(SCRIPTS) $(INSTALL_DIR)/
diff --git a/tests/meson.build b/tests/meson.build
new file mode 100644
index 000000000000..95ec29e3372b
--- /dev/null
+++ b/tests/meson.build
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: CC0-1.0
+
+tests = files([
+    'kms-test-allplanes.py',
+    'kms-test-brxalloc.py',
+    'kms-test-connectors.py',
+    'kms-test-crc.py',
+    'kms-test-formats.py',
+    'kms-test-legacy-modeset.py',
+    'kms-test-modes.py',
+    'kms-test-modeset.py',
+    'kms-test-pageflip.py',
+    'kms-test-plane-alpha.py',
+    'kms-test-plane-blendmode.py',
+    'kms-test-plane-position.py',
+    'kms-test-plane-zpos.py',
+    'kms-test-routing.py',
+    'kmstest.py',
+])
+
+install_data(tests, install_dir : get_option('bindir'))
-- 
Regards,

Laurent Pinchart

