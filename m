Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067FAC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 22:34:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C962E214D8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 22:34:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfCKWeT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 18:34:19 -0400
Received: from sauhun.de ([88.99.104.3]:33344 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbfCKWeT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 18:34:19 -0400
Received: from localhost (p54B3359D.dip0.t-ipconnect.de [84.179.53.157])
        by pokefinder.org (Postfix) with ESMTPSA id C7CD23E4093;
        Mon, 11 Mar 2019 23:34:16 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools 2/2] tools: restrict all addresses defined by the standard
Date:   Mon, 11 Mar 2019 23:33:35 +0100
Message-Id: <20190311223335.18586-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
References: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The I2C standard reserves addresses 0x03-0x07. Adapt our tools to that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 CHANGES             | 1 +
 tools/i2cbusses.c   | 2 +-
 tools/i2cdetect.8   | 2 +-
 tools/i2cdetect.c   | 2 +-
 tools/i2cdump.8     | 4 ++--
 tools/i2cdump.c     | 2 +-
 tools/i2cget.8      | 4 ++--
 tools/i2cget.c      | 2 +-
 tools/i2cset.8      | 4 ++--
 tools/i2cset.c      | 2 +-
 tools/i2ctransfer.8 | 4 ++--
 11 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index e9d46b5..e3ff3a0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,6 +3,7 @@ i2c-tools CHANGES
 
 master
   tools: Consistently use snprintf instead of sprintf
+         Restrict addresses 0x03-0x07, too (defined by I2C standard)
   decode-dimms: Print SPD revision for DDR3 too
                 Move SDR-specific code
   i2ctransfer: Mention '-a' everywhere in the manpage
diff --git a/tools/i2cbusses.c b/tools/i2cbusses.c
index 438f345..b4f00ae 100644
--- a/tools/i2cbusses.c
+++ b/tools/i2cbusses.c
@@ -381,7 +381,7 @@ int parse_i2c_address(const char *address_arg, int all_addrs)
 {
 	long address;
 	char *end;
-	long min_addr = 0x03;
+	long min_addr = 0x08;
 	long max_addr = 0x77;
 
 	address = strtol(address_arg, &end, 0);
diff --git a/tools/i2cdetect.8 b/tools/i2cdetect.8
index 81d0f97..14c1f18 100644
--- a/tools/i2cdetect.8
+++ b/tools/i2cdetect.8
@@ -26,7 +26,7 @@ outputs a table with the list of detected devices on the specified bus.
 \fIi2cbus\fR indicates the number or name of the I2C bus to be scanned, and
 should correspond to one of the busses listed by \fIi2cdetect -l\fR.
 The optional parameters \fIfirst\fR and \fIlast\fR restrict the scanning
-range (default: from 0x03 to 0x77).
+range (default: from 0x08 to 0x77).
 .PP
 As there is no standard I2C detection command, i2cdetect uses arbitrary
 SMBus commands (namely SMBus quick write and SMBus receive byte) to probe
diff --git a/tools/i2cdetect.c b/tools/i2cdetect.c
index 1804f84..0b9af48 100644
--- a/tools/i2cdetect.c
+++ b/tools/i2cdetect.c
@@ -204,7 +204,7 @@ int main(int argc, char *argv[])
 	char filename[20];
 	unsigned long funcs;
 	int mode = MODE_AUTO;
-	int first = 0x03, last = 0x77;
+	int first = 0x08, last = 0x77;
 	int flags = 0;
 	int yes = 0, version = 0, list = 0;
 
diff --git a/tools/i2cdump.8 b/tools/i2cdump.8
index 2240f3c..18bf600 100644
--- a/tools/i2cdump.8
+++ b/tools/i2cdump.8
@@ -43,12 +43,12 @@ will perform the operation directly. This is mainly meant to be used in
 scripts.
 .TP
 .B -a
-Allow using addresses between 0x00 - 0x02 and 0x78 - 0x7f. Not recommended.
+Allow using addresses between 0x00 - 0x07 and 0x78 - 0x7f. Not recommended.
 .PP
 At least two options must be provided to i2cdump. \fIi2cbus\fR indicates the
 number or name of the I2C bus to be scanned. This number should correspond to one
 of the busses listed by \fIi2cdetect -l\fR. \fIaddress\fR indicates the
-address to be scanned on that bus, and is an integer between 0x03 and 0x77.
+address to be scanned on that bus, and is an integer between 0x08 and 0x77.
 .PP
 The \fImode\fR parameter, if specified, is one of the letters \fBb\fP, \fBw\fP,
 \fBs\fP, or \fBi\fP, corresponding to a read size of a single byte, a 16-bit
diff --git a/tools/i2cdump.c b/tools/i2cdump.c
index 3bd2077..70cecb9 100644
--- a/tools/i2cdump.c
+++ b/tools/i2cdump.c
@@ -38,7 +38,7 @@ static void help(void)
 	fprintf(stderr,
 		"Usage: i2cdump [-f] [-y] [-r first-last] [-a] I2CBUS ADDRESS [MODE [BANK [BANKREG]]]\n"
 		"  I2CBUS is an integer or an I2C bus name\n"
-		"  ADDRESS is an integer (0x03 - 0x77, or 0x00 - 0x7f if -a is given)\n"
+		"  ADDRESS is an integer (0x08 - 0x77, or 0x00 - 0x7f if -a is given)\n"
 		"  MODE is one of:\n"
 		"    b (byte, default)\n"
 		"    w (word)\n"
diff --git a/tools/i2cget.8 b/tools/i2cget.8
index 8b48ad7..680279f 100644
--- a/tools/i2cget.8
+++ b/tools/i2cget.8
@@ -37,12 +37,12 @@ will perform the operation directly. This is mainly meant to be used in
 scripts. Use with caution.
 .TP
 .B -a
-Allow using addresses between 0x00 - 0x02 and 0x78 - 0x7f. Not recommended.
+Allow using addresses between 0x00 - 0x07 and 0x78 - 0x7f. Not recommended.
 .PP
 There are two required options to i2cget. \fIi2cbus\fR indicates the number
 or name of the I2C bus to be scanned.  This number should correspond to one of
 the busses listed by \fIi2cdetect -l\fR. \fIchip-address\fR specifies the
-address of the chip on that bus, and is an integer between 0x03 and 0x77.
+address of the chip on that bus, and is an integer between 0x08 and 0x77.
 .PP
 \fIdata-address\fR specifies the address on that chip to read from, and is
 an integer between 0x00 and 0xFF. If omitted, the currently active register
diff --git a/tools/i2cget.c b/tools/i2cget.c
index d2ed56a..1db4f39 100644
--- a/tools/i2cget.c
+++ b/tools/i2cget.c
@@ -43,7 +43,7 @@ static void help(void)
 	fprintf(stderr,
 		"Usage: i2cget [-f] [-y] [-a] I2CBUS CHIP-ADDRESS [DATA-ADDRESS [MODE]]\n"
 		"  I2CBUS is an integer or an I2C bus name\n"
-		"  ADDRESS is an integer (0x03 - 0x77, or 0x00 - 0x7f if -a is given)\n"
+		"  ADDRESS is an integer (0x08 - 0x77, or 0x00 - 0x7f if -a is given)\n"
 		"  MODE is one of:\n"
 		"    b (read byte data, default)\n"
 		"    w (read word data)\n"
diff --git a/tools/i2cset.8 b/tools/i2cset.8
index cd53aba..8c73c60 100644
--- a/tools/i2cset.8
+++ b/tools/i2cset.8
@@ -57,12 +57,12 @@ value written. This used to be the default behavior. The same limitations
 apply as those of option \fB-m\fR.
 .TP
 .B -a
-Allow using addresses between 0x00 - 0x02 and 0x78 - 0x7f. Not recommended.
+Allow using addresses between 0x00 - 0x07 and 0x78 - 0x7f. Not recommended.
 .PP
 There are three required options to i2cset. \fIi2cbus\fR indicates the number
 or name of the I2C bus to be scanned.  This number should correspond to one of
 the busses listed by \fIi2cdetect -l\fR. \fIchip-address\fR specifies the
-address of the chip on that bus, and is an integer between 0x03 and 0x77.
+address of the chip on that bus, and is an integer between 0x08 and 0x77.
 \fIdata-address\fR specifies the address on that chip to write to, and is an
 integer between 0x00 and 0xFF.
 .PP
diff --git a/tools/i2cset.c b/tools/i2cset.c
index e82dc52..f0430f2 100644
--- a/tools/i2cset.c
+++ b/tools/i2cset.c
@@ -40,7 +40,7 @@ static void help(void)
 	fprintf(stderr,
 		"Usage: i2cset [-f] [-y] [-m MASK] [-r] [-a] I2CBUS CHIP-ADDRESS DATA-ADDRESS [VALUE] ... [MODE]\n"
 		"  I2CBUS is an integer or an I2C bus name\n"
-		"  ADDRESS is an integer (0x03 - 0x77, or 0x00 - 0x7f if -a is given)\n"
+		"  ADDRESS is an integer (0x08 - 0x77, or 0x00 - 0x7f if -a is given)\n"
 		"  MODE is one of:\n"
 		"    c (byte, no value)\n"
 		"    b (byte data, default)\n"
diff --git a/tools/i2ctransfer.8 b/tools/i2ctransfer.8
index 1f8ed82..d16e34e 100644
--- a/tools/i2ctransfer.8
+++ b/tools/i2ctransfer.8
@@ -64,7 +64,7 @@ It will print infos about all messages sent, i.e. not only for read messages but
 Display the version and exit.
 .TP
 .B -a
-Allow using addresses between 0x00 - 0x02 and 0x78 - 0x7f. Not recommended.
+Allow using addresses between 0x00 - 0x07 and 0x78 - 0x7f. Not recommended.
 
 .SH ARGUMENTS
 .PP
@@ -95,7 +95,7 @@ It is parsed as an unsigned 16 bit integer, but note that the Linux Kernel appli
 .B [@address]
 specifies the 7-bit address of the chip to be accessed for this message, and is an integer.
 If omitted, reuse the previous address.
-Normally, addresses outside the range of 0x03-0x77 and addresses with a kernel driver attached to them will be blocked.
+Normally, addresses outside the range of 0x08-0x77 and addresses with a kernel driver attached to them will be blocked.
 This can be overridden with
 .I -a
 (all) or
-- 
2.11.0

