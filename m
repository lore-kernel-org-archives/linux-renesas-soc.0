Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42956 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729605AbeKFT5P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 14:57:15 -0500
Subject: Re: [PATCH 2/2] arm64: dts: r8a77990: ebisu: Enable SDHI interfaces
To: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20181105214117.11734-1-marek.vasut+renesas@gmail.com>
 <20181105214117.11734-2-marek.vasut+renesas@gmail.com>
 <20181106083450.GB1054@kunai>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <3e933acf-33d1-ca27-e463-57345c79396a@gmail.com>
Date: Tue, 6 Nov 2018 10:18:01 +0100
MIME-Version: 1.0
In-Reply-To: <20181106083450.GB1054@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/06/2018 09:34 AM, Wolfram Sang wrote:
> 
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
> Shouldn't we have only one pinctrl config here, like you did recently
> for the other Gen3 SoCs?

We should, thanks for pointing it out, fixed in V2.

-- 
Best regards,
Marek Vasut
