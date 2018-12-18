Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E17C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 12:58:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83E52217D7
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 12:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbeLRM60 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 07:58:26 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:42741 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbeLRM6Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 07:58:25 -0500
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=SVR-IES-MBX-04.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1gZEwz-0003Ae-Fm from Vladimir_Zapolskiy@mentor.com ; Tue, 18 Dec 2018 04:58:17 -0800
Received: from [137.202.108.130] (137.202.0.90) by
 SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Tue, 18 Dec 2018 12:58:13 +0000
Subject: Re: [PATCH] gpio: rcar: select General Output Register to set output
 states
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20181210142135.23960-1-vladimir_zapolskiy@mentor.com>
 <CAMuHMdVd=TOgs0FM5GxPor7JLYFdN_M1Qs5nsm2EBcz8OJ_KHw@mail.gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From:   Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <1b56f293-0584-828b-95e5-259046f389d8@mentor.com>
Date:   Tue, 18 Dec 2018 14:58:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVd=TOgs0FM5GxPor7JLYFdN_M1Qs5nsm2EBcz8OJ_KHw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 12/16/2018 12:03 PM, Geert Uytterhoeven wrote:
> Hi Vladimir,
> 
> (increasing review priority due to Linus applying the patch)
> 
> On Mon, Dec 10, 2018 at 3:22 PM Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com> wrote:
>> R-Car GPIO controller provides two interfaces to set GPIO line output
>> signal state, and for a particular GPIO line the selected interface is
>> determined by OUTDTSEL bit value.
>>
>> At the moment the driver supports only one of two interfaces, namely
>> OUTDT General Output Register is used to control the output signal.
>>
>> While this selection is the default one on reset, it is not explicitly
>> configured on probe, thus it might be possible that kernel and userspace
>> consumers of a GPIO won't be able to set the wanted GPIO output signal.
>>
>> Below is a simple test case to reproduce the described problem and
>> verify this fix in the kernel on H3 ULCB by setting non-default OUTDTSEL
>> configuration from a bootloader:
>>
>>   u-boot    > mw.l 0xe6055440 0x3000 1
>>   ...
>>   userspace > echo -n default-on > /sys/devices/platform/leds/leds/led5/trigger
>>   userspace > echo -n default-on > /sys/devices/platform/leds/leds/led6/trigger
>>
>> Fixes: 119f5e448d32c ("gpio: Renesas R-Car GPIO driver V3")
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> 
> Thanks for your patch!
> 
>> The proposed change could be seen as an invitation for a more interesting
>> discussion about a necessity to add a pretty trivial support of the second
>> interface, for instance by selecting between OUTDT and OUTDTH/OUTDTL on
>> basis of read-only value of OUTDTSEL register, or, simply by switching
>> the driver to use the second interface only, because it does not require
>> an additional gpio_rcar_read() call, theoretically it should give noticeably
>> faster rate of bitbanging.
>>
>> For reference the problem with the original interface comes from an inability
>> to set GPIO output signals from an RTOS, which runs in parallel to Linux and
>> wants to control some GPIOs on its own, usage of OUTDTH/OUTDTL excludes
>> a race in concurrent read/write register operations.
>>
>> As a note in my opinion the selection of OUTDT vs. OUTDTH/OUTDTL should
>> NOT be done in DTS, extension to 3-cell values for GPIO consumers seems
>> unreasonable.
> 
> Indeed, this is pure software configuration, not hardware description, so it
> does not belong in DT.
> 
>> Below is the list of helpful tips for change reviewers, comments are welcome:
>> * I didn't manage to find H1 or M1A User's Manuals to confirm that
>>   OUTDTSEL register and the second OUTDTH/OUTDTL interface is present
>>   on the GPIO controllers found on R-Car Gen1 SoCs,
> 
> Unfortunately R-Car M1A and H1 do not have the OUTDTSEL nor OUTDTH/OUTDL
> registers. So your patch may break them.

FWIW I've managed to find only R01UH0573EJ0100 Rev.1.00 R-Car D1 User’s
Manual (see Merlot evaluation board), and it describes OUTDTSEL/OUTDTH/OUTDTL
and BOTHEDGE registers, thus a GPIO controller on this R-Car Gen1 SoC looks
similar to GPIO controllers on R-Car Gen2/Gen3 SoCs.

Thank you for clarification about R-Car M1A and H1 GPIO controllers, my v2
is in progress.

>> * Fixes tag here is pretty weak, nevertheless I suppose it is a fix in fact,
> 
> IMHO the SHA1 is not appropriate, as commit 119f5e448d32c ("gpio: Renesas
> R-Car GPIO driver V3") added support for R-Car Gen1 only, while the OUTDT*
> registers appeared in R-Car Gen2.
> 
>> * gpio_rcar_suspend()/gpio_rcar_resume() don't respect OUTDTSEL/OUTDTH/OUTDTL
>>   values, if there is a reason to dump/restore registers, it might be good
>>   to include them to the list also,
> 
> Given resume calls gpio_rcar_direction_{in,out}put(), at least OUTDTSEL
> will be restored for output. Is that sufficient, or should it be restored for
> input, too?

Hmm, I was reflecting on necessity to save/restore OUTDTSEL value as a whole
independently of per line gpiochip_line_is_valid() value, but let's omit it.

I'm still influenced by a use-case of competing access to a GPIO controller
from two OSes, there might be an overlapping with Linux PM routines in
the driver.

As a side note I'm not convinced that gpiochip_line_is_valid() and
gpiochip->valid_mask usage in the driver is justified, unless it is agreed
that 'gpio-reserved-ranges' property is really supposed to describe "holes"
in GPIO controllers. The property found in r8a77470.dtsi (RZ/G1C) looks like
a kludge instead of making a proper assignment of 'gpio-ranges' property:

-                       gpio-ranges = <&pfc 0 96 30>;
-                       gpio-reserved-ranges = <17 10>;
+                       gpio-ranges = <&pfc 0 96 17>, <&pfc 27 123 3>;

The change above is untested and I have no access to RZ/G1C manual, it is
shared just to demonstrate an alternative idea of describing holes.

>> * alternatively it might be possible to replace the original interface with
>>   OUTDTH/OUTDTL one, it will be a nice valid fix also.
> 
> Unfortunately that is not supported by all SoCs supported by the driver.

Would it be seen as beneficial to add support of a likely better interface
for modern SoCs? The associated complexity in the driver won't be drastic.

--
Best wishes,
Vladimir
