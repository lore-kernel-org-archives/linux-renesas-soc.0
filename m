Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D27CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 13:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FB1F218A1
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 13:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbfCONYs convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 09:24:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:38042 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727139AbfCONYs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 09:24:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 48A7FAD33;
        Fri, 15 Mar 2019 13:24:47 +0000 (UTC)
Date:   Fri, 15 Mar 2019 14:24:46 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools 2/2] tools: restrict all addresses defined by
 the standard
Message-ID: <20190315142446.5571d5aa@endymion>
In-Reply-To: <20190311223335.18586-3-wsa+renesas@sang-engineering.com>
References: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
        <20190311223335.18586-3-wsa+renesas@sang-engineering.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, 11 Mar 2019 23:33:35 +0100, Wolfram Sang wrote:
> The I2C standard reserves addresses 0x03-0x07. Adapt our tools to that.

I have a different interpretation of the specification. Addresses
0x04-0x07 are marked as "Hs-mode master code". They are not explicitly
marked as "reserved" (although admittedly the table is named "Reserved
addresses"). My understanding is that HS-mode will "use" these
addresses, which means that you can't use HS-mode _and_ slaves at
addresses 0x04-0x07 on the same I²C bus segment. I do not read this as
"non-HS-mode slaves can't use these addresses". But maybe this is just
me, and also I don't know that much about HS-mode really.

Address 0x03 is indeed reserved, so obviously that this really makes me
wonder how the original range of 0x03-0x77 was decided. Unfortunately
the git history doesn't go that far (this range was already used in
i2cget and i2cdetect at the time i2c-tools was split to its own
repository). But I was able to dig out an old lm-sensors commit:

commit e1c8fe76763bfa7e9261a5a024755d2274a8b14b
Author: Mark D. Studebaker
Date:   Sat Mar 20 17:23:31 2004 +0000

    scan address 0x03 again
    
    
    git-svn-id: http://lm-sensors.org/svn/lm-sensors/trunk@2377 7894878c-1315-0410-8ee3-d5d059ff63e0

diff --git a/prog/detect/i2cdetect.c b/prog/detect/i2cdetect.c
index 43bb704265ac..8d96591493aa 100644
--- a/prog/detect/i2cdetect.c
+++ b/prog/detect/i2cdetect.c
@@ -159,7 +159,7 @@ int main(int argc, char *argv[])
   for (i = 0; i < 128; i+=16) {
     printf("%02x: ",i);
     for(j = 0; j < 16; j++) {
-      if (!force && (i+j<0x04 || i+j>0x77)) {
+      if (!force && (i+j<0x03 || i+j>0x77)) {
         printf("   ");
         continue;
       }
diff --git a/prog/detect/sensors-detect b/prog/detect/sensors-detect
index adc6ef2f2fb9..2aa0575ce7b3 100755
--- a/prog/detect/sensors-detect
+++ b/prog/detect/sensors-detect
@@ -2418,7 +2418,7 @@ sub scan_adapter
   binmode FILE;
 
   # Now scan each address in turn
-  foreach $addr (0x04..0x77) {
+  foreach $addr (0x03..0x77) {
     # As the not_to_scan list is sorted, we can check it fast
     if (@not_to_scan and $not_to_scan[0] == $addr) {
       shift @not_to_scan;

Unfortunately no rationale in the log message, so this does not tell us
why address 0x03 was rehabilitated. I can only speculate that someone
had an actual device responding to address 0x03 back then.

That being said... In the end it doesn't really matter if addresses
0x03-0x07 are considered reserved but "should not", as long as the user
has an option to override that limitation. Now that such an option is
consistently available for all i2c tools, I have no objection to being
more conservative by default.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
