Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34792 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751329AbdIDVQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Sep 2017 17:16:37 -0400
Received: by mail-lf0-f49.google.com with SMTP id l196so5129993lfl.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Sep 2017 14:16:36 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: ulcb: Enable display output
To: Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20170822142326.9652-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170830072850.GJ10398@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <0178cc2f-13ef-e6df-b8cc-46f51c8a93f6@cogentembedded.com>
Date: Tue, 5 Sep 2017 00:16:33 +0300
MIME-Version: 1.0
In-Reply-To: <20170830072850.GJ10398@verge.net.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On 30.08.2017 10:28, Simon Horman wrote:
> On Tue, Aug 22, 2017 at 05:23:26PM +0300, Laurent Pinchart wrote:
>> The DU is already wired up to the HDMI encoder, all we need to do is
>> enable it.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> ---
>>   arch/arm64/boot/dts/renesas/ulcb.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> This patch has been tested on the M3-W ULCB in Magnus' board farm. As no
>> display is connected to the HDMI output testing was limited, to probing the
>> device and verifying that it can be accessed from userspace.
>>
>> Tests on the H3 ES1.1 and H3 ES2.0 ULCBs were less successful as I couldn't
>> get the boards to boot properly, but they failed without this patch as well,
>> so I don't think it should be a blocker.
> Thanks, applied.
Sorry for late reply.

This patch was verified with HDMI display on M3W and H3 ULCB boards with 
following patches applied:
https://patchwork.kernel.org/patch/9688551/
https://patchwork.kernel.org/patch/9831835/
https://patchwork.kernel.org/patch/9801239/
