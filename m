Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35228 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729241AbeKFT5O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 14:57:14 -0500
Subject: Re: [PATCH 2/2] arm64: dts: r8a77990: ebisu: Enable SDHI interfaces
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: TAKESHI KIHARA <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
References: <20181105214117.11734-1-marek.vasut+renesas@gmail.com>
 <20181105214117.11734-2-marek.vasut+renesas@gmail.com>
 <OSBPR01MB2293D944698EE5776B23B00DD8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <cf18a8e6-e550-d7d0-c66c-fb5874b7a65c@gmail.com>
Date: Tue, 6 Nov 2018 10:17:41 +0100
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2293D944698EE5776B23B00DD8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/06/2018 06:29 AM, Yoshihiro Shimoda wrote:
> Hello Marek-san,

Hello Shimoda-san,

>> From: Marek Vasut, Sent: Tuesday, November 6, 2018 6:41 AM
>>
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch enables SD card slot connected to SDHI0, micro SD card slot
>> connected to SDHI1 and eMMC connected to SDHI3 on the Ebisu board using
>> the R8A77990 SoC.
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa@the-dreams.de>
>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
> 
> Thank you for the patch!
> 
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> I have a few nit comments below.
> 
>>  .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 136 ++++++++++++++++++
>>  1 file changed, 136 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
>> index 611f0265fcc5..bda1765dcdbd 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> <snip>
>> +	sdhi3_pins: sd3 {
>> +		groups = "sdhi3_data8", "sdhi3_ctrl";
>> +		function = "sdhi3";
>> +		power-source = <1800>;
>> +	};
>> +
>> +	sdhi3_pins_uhs: sd3_uhs {
>> +		groups = "sdhi3_data8", "sdhi3_ctrl";
>> +		function = "sdhi3";
>> +		power-source = <1800>;
>> +	};
> 
> I assumed that we will add "sdhi3_ds" into these groups when we add support for HS400 mode.

That's a good point, I think we can add it right away, so added in V2.

-- 
Best regards,
Marek Vasut
