Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:50991 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967185AbeBNKXd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 05:23:33 -0500
Subject: Re: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
 <20180214060547.bf6upib2mbgoexas@katana>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e7483b9c-4e1e-47ff-d044-fd4853b96e94@gmail.com>
Date: Wed, 14 Feb 2018 11:21:13 +0100
MIME-Version: 1.0
In-Reply-To: <20180214060547.bf6upib2mbgoexas@katana>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/14/2018 07:05 AM, Wolfram Sang wrote:
>> +	chosen {
>> +		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
>> +		stdout-path = "serial0:38400n8";
> 
> Hmm, that would be our first board to not have 115200, or? We already
> have some other boards upstream where UBoot has 38400 and Linux 115200.
> I'd prefer consistency here a little, but no strong opinion and asking
> for other opinions.

The vendoruboot is wired to 38400 (sigh), I'm planning to set mainline
uboot to 115200 though.

>> +	vcc_sdhi0: regulator-vcc-sdhi0 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "SDHI0 Vcc";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&gpio5 24 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
> 
> Just double checking: No 1.8V for SDR50/104?

Nope, the SD card slot is hard-wired to 3V3.

-- 
Best regards,
Marek Vasut
