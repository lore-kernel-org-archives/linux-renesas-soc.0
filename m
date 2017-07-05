Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48149 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751626AbdGEKWZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 06:22:25 -0400
Subject: Re: [PATCHv6] arm64: dts: renesas: salvator-x: Add ADV7482 support
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <1498576541-15384-1-git-send-email-kbingham@kernel.org>
 <CAMuHMdWbxsj_=quOaZfEBfhN3geBhcYaOkBXUAeBazCM601uNA@mail.gmail.com>
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <f11bb86a-ce60-3f18-333d-0d008dab4b2f@ideasonboard.com>
Date: Wed, 5 Jul 2017 11:22:21 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWbxsj_=quOaZfEBfhN3geBhcYaOkBXUAeBazCM601uNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/07/17 10:43, Geert Uytterhoeven wrote:
> On Tue, Jun 27, 2017 at 5:15 PM, Kieran Bingham <kbingham@kernel.org> wrote:
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> The Salvator boards use an ADV7482 receiver for HDMI and CVBS inputs.
>>
>> Provide ADV7482 node on the i2c4 bus, along with connectors for the
>> hdmi and cvbs inputs, and link to the csi20 and csi40 nodes as outputs.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> ---
>>
>> Submitting this directly to Niklas, as these changes depend on his VIN
>> DT patches, and has agreed to 'take' this patch on to that series.
> 
> Yeah, haven't seen any patches yet adding "csi20" and "csi40" nodes ;-)

I defer this comment to Niklas :-)

--
Kieran


> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
