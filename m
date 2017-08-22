Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34541 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932427AbdHVMXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 08:23:43 -0400
Received: by mail-lf0-f49.google.com with SMTP id g77so46340558lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Aug 2017 05:23:42 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: dts: r8a7743: add IIC cores to dtsi
To: Chris Paterson <Chris.Paterson2@renesas.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
References: <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
 <1502704398-28378-1-git-send-email-biju.das@bp.renesas.com>
 <TY1PR06MB07027D9A55FBFE2D591CEDCFB7840@TY1PR06MB0702.apcprd06.prod.outlook.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b7434757-b151-5971-2b5f-525eeaf11467@cogentembedded.com>
Date: Tue, 22 Aug 2017 15:23:39 +0300
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB07027D9A55FBFE2D591CEDCFB7840@TY1PR06MB0702.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/22/2017 12:10 PM, Chris Paterson wrote:

>> From: Biju Das [mailto:biju.das@bp.renesas.com]
>> Sent: 14 August 2017 10:53
>>
>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>> ---
>> v1-->v2
>>     Corrected the resets property for i2c6 device node.
> 
> Are you happy with this version of the patch?
> 
> Or is the discussion for moving to 'iic' still alive?

    Yes, appears so. I'd like the labels to be named iic<n>.

> Thanks, Chris

MBR, Sergei
