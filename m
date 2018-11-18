Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37454 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbeKSKIg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 05:08:36 -0500
From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add and enable
 CAN,FD device nodes
To: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
References: <20181118173424.4807-1-marek.vasut+renesas@gmail.com>
 <20181118230313.GB2553@kunai>
Message-ID: <63e27a31-d599-4672-87b9-48b0f542313d@gmail.com>
Date: Mon, 19 Nov 2018 00:45:16 +0100
MIME-Version: 1.0
In-Reply-To: <20181118230313.GB2553@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/19/2018 12:03 AM, Wolfram Sang wrote:
> On Sun, Nov 18, 2018 at 06:34:24PM +0100, Marek Vasut wrote:
>> This patch adds CAN0,1 and CANFD device nodes for the r8a77990 SoC
>> and enables CANFD connected to CN10 on the E3 Ebisu board using the
>> R8A77990 SoC.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-renesas-soc@vger.kernel.org
> 
> Same here, what was tested?

I connected the CN10 to Peak CANFD, brought both interfaces up at
125kBd/250kBd for FD
$ ip link set canX up type can bitrate 125000 dbitrate 250000 fd on

And ran on either side:
$ cangen -m canX
and
$ candump -t d -dex canX
This should give a good mix of CAN messages.

-- 
Best regards,
Marek Vasut
