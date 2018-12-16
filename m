Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B14C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 19:06:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A00E2082F
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 19:06:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730835AbeLPTG5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 14:06:57 -0500
Received: from mleia.com ([178.79.152.223]:46334 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730097AbeLPTG5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 14:06:57 -0500
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 1B4E6433606;
        Sun, 16 Dec 2018 19:06:56 +0000 (GMT)
Subject: Re: [PATCH] gpio: rcar: select General Output Register to set output
 states
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20181210142135.23960-1-vladimir_zapolskiy@mentor.com>
 <CACRpkdbpfxoSiXYskq7FS_Frb_q=TeZ2KNoiC5EPJDUB0tbegg@mail.gmail.com>
 <CAMuHMdU45DoMpuR3_yazRhWWTyyQkDpB05RsG_U9+Bc70fx_zg@mail.gmail.com>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <4eda074d-3bcf-4266-ad9b-b4a1dbc11ceb@mleia.com>
Date:   Sun, 16 Dec 2018 21:06:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU45DoMpuR3_yazRhWWTyyQkDpB05RsG_U9+Bc70fx_zg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20181216_190656_133575_406F4D2F 
X-CRM114-Status: GOOD (  16.65  )
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Linus, Geert,

On 12/16/2018 12:04 PM, Geert Uytterhoeven wrote:
> Hi Linus,
> 
> On Sun, Dec 16, 2018 at 1:19 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Mon, Dec 10, 2018 at 3:22 PM Vladimir Zapolskiy
>> <vladimir_zapolskiy@mentor.com> wrote:
>>> R-Car GPIO controller provides two interfaces to set GPIO line output
>>> signal state, and for a particular GPIO line the selected interface is
>>> determined by OUTDTSEL bit value.
>>>
>>> At the moment the driver supports only one of two interfaces, namely
>>> OUTDT General Output Register is used to control the output signal.
>>>
>>> While this selection is the default one on reset, it is not explicitly
>>> configured on probe, thus it might be possible that kernel and userspace
>>> consumers of a GPIO won't be able to set the wanted GPIO output signal.
>>>
>>> Below is a simple test case to reproduce the described problem and
>>> verify this fix in the kernel on H3 ULCB by setting non-default OUTDTSEL
>>> configuration from a bootloader:
>>>
>>>   u-boot    > mw.l 0xe6055440 0x3000 1
>>>   ...
>>>   userspace > echo -n default-on > /sys/devices/platform/leds/leds/led5/trigger
>>>   userspace > echo -n default-on > /sys/devices/platform/leds/leds/led6/trigger
>>>
>>> Fixes: 119f5e448d32c ("gpio: Renesas R-Car GPIO driver V3")
>>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>>
>> Patch applied for devel as "non-urgent fix" as I can't see any
>> immediate regressions.
> 
> Unfortunately the driver now writes unconditionally to a register that does
> not exist on R-Car Gen1. Hence please revert the patch.

yes, for sure revert the change then.

I'll prepare v2 which does not touch R-Car Gen1 platforms.

--
Best wishes,
Vladimir
