Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54996 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbeJ2Q4q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 12:56:46 -0400
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator: Switch eMMC bus to 1V8
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-mmc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20181027163410.7417-1-marek.vasut+renesas@gmail.com>
 <20181027163410.7417-2-marek.vasut+renesas@gmail.com>
 <20181028213444.GA1096@kunai>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f63a5c27-ea7d-e1f0-9bbb-211f56be8ad9@gmail.com>
Date: Mon, 29 Oct 2018 09:01:29 +0100
MIME-Version: 1.0
In-Reply-To: <20181028213444.GA1096@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/28/2018 10:34 PM, Wolfram Sang wrote:
> Hi Marek,

Hi,

> On Sat, Oct 27, 2018 at 06:34:10PM +0200, Marek Vasut wrote:
>> The eMMC card has two supplies, VCC and VCCQ. The VCC supplies the NAND
>> array and the VCCQ supplies the bus. On this particular board, the VCC is
>> connected to 3.3V rail, while the VCCQ is connected to 1.8V rail. Adjust
>> the pinmux to match the bus, which is always operating in 1.8V mode.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Thanks for this!
> 
> I think Olof (and thus, Simon ;)) will be happy if those two patches are
> merged.

Fine by me.

> Other than that, I think we should remove sdhi2_pins_uhs then because it
> is the same as sdhi2_pins. And then use later "pinctrl-1 =
> <&sdhi2_pins>;". So, basically the same phandles for both pinctrls. We
> can re-add the second one when we need it.

I wonder if removing the sdhi2_pins_uhs is what we want to do, given
that we might need to adjust TDSEL or pull resistor configurations for
the HS200/HS400 modes in the future.

Thoughts ?

>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa@the-dreams.de>
>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> index 7d3d866a0063..d9a309b28fcf 100644
>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> @@ -602,7 +602,7 @@
>>  	sdhi2_pins: sd2 {
>>  		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
>>  		function = "sdhi2";
>> -		power-source = <3300>;
>> +		power-source = <1800>;
>>  	};
>>  
>>  	sdhi2_pins_uhs: sd2_uhs {
>> -- 
>> 2.17.1
>>


-- 
Best regards,
Marek Vasut
