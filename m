Return-Path: <devicetree-owner@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77965: Add CAN controller
 nodes
To: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20181118173327.4704-1-marek.vasut+renesas@gmail.com>
 <20181118230250.GA2553@kunai>
Message-ID: <6ffce819-4d8e-e54a-ba82-0845c36a6ec4@gmail.com>
Date: Mon, 19 Nov 2018 00:46:02 +0100
MIME-Version: 1.0
In-Reply-To: <20181118230250.GA2553@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/19/2018 12:02 AM, Wolfram Sang wrote:
> On Sun, Nov 18, 2018 at 06:33:26PM +0100, Marek Vasut wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch adds CAN{0,1} controller nodes for the R8A77965 SoC.
>>
>> Based on several similar patches of the R8A7795 device tree
>> by Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
>> and Geert Uytterhoeven <geert+renesas@glider.be>.
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
> 
> Were you able to do some testing using EXIO connectors? Would be nice to
> know what was tested.

Not on the M3N, since I don't see it broken out on the EXIO ; is it
really there ? It'd be easy to test on M3NSK with KF, but I don't have
either KF or M3NSK.

-- 
Best regards,
Marek Vasut
