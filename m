Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4D1449ECF;
	Wed, 21 Jan 2026 22:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035498; cv=none; b=np9BVOOwWfjy4TVxHEeoITuOkvy2JYqsVL8TCyp92JDw6AURJpqkMxsHzHZnhbUzQzR6YNmmOkPE1Ou9TX3klN5zI+LpWgJFnTeFUfx1PWmVXcGeS7xywsKlcfUyVNLZbfNYgILE6HUG3In9Ja5tBbXjuuciRbPN5ojAb41Wn+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035498; c=relaxed/simple;
	bh=NfNLgGaNG8tEtO+T+PCm2QyL9in0BOFgaju7GrOY8Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DJ0KRReoF8hDL9/JhbymVnv8TZIwMDmkQt6YPrzUYuT3jdUwHwuJwcGIQXVhM6wb3rB3VwajWNbLcB61GaukAbq6qEPhD+YyGV5iV/tl7kGaQsn5lJbdFQbLsvaehPRidleH1yFmZwyT1sM2xioV8MrR3YhPIfKq2m2lHf6djRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DuI7x1B8; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DuI7x1B8"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dxK5K05kfz9tCQ;
	Wed, 21 Jan 2026 23:44:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769035493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4erEKk/kx2Qi8GHsQ10UVtCdb2WmHG32BZt6WMNptI=;
	b=DuI7x1B8S110FS9yoF8xVuV6H+z5vkYnTZ3oIMRcCqQSFBaSfM4onXalKS/sfmzRhRzbQE
	9B2rBwudxnufsjs9p3y1hp+LQDdlwUoUogr4aE6M16iuydbiYFJGWZBCEFdiCXVwJ7DShD
	w9EdDavzF/C8j30v50nFwCLHl5i7dxBZkE09tOCTt9JIAu3IpXedZVVgOUFgBHe5tZO4Yi
	PVEo4IpSRnJL9YOYDNIM0g7tH1l8Q/sfgRe0GQp53rF+jQscNS+rFyllZl+kKfi6tgmD8U
	wjlppTs44RxzATpA8yW/jIQQ8Q/+qovkAhBGHi1/WpgCC9Lo4+DhRUo9cfd6Jg==
Message-ID: <6f817993-1b4a-4600-a771-d6c25efc668b@mailbox.org>
Date: Wed, 21 Jan 2026 18:38:00 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0
 clock generator
To: Geert Uytterhoeven <geert@linux-m68k.org>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
 <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: b4aobdw146wnxrmuf1fpjp7jzwxghan6
X-MBO-RS-ID: 8813b9a2c165de6f9d5

On 1/21/26 2:48 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> @@ -439,6 +445,13 @@ adv7511_out: endpoint {
>>                  };
>>          };
>>
>> +       pcie_usb_clk: clk@68 {
>> +               compatible = "renesas,9fgv0841";
>> +               reg = <0x68>;
>> +               clocks = <&pcie_usb_refclk>;
>> +               #clock-cells = <1>;
>> +       };
> 
> During boot, the rs9 prints a warning:
> 
>      clk-renesas-pcie-9series 0-0068: No cache defaults, reading back from HW
> 
> which probably shouldn't be printed at the warning level?

+CC Mark . Reading the (default) register values from hardware on first 
boot is the valid/right thing to do, so this could be demoted to 
dev_dbg() . Or is there some specific usecase where this should be a 
warning ?

>> +
>>          video-receiver@70 {
>>                  compatible = "adi,adv7482";
>>                  reg = <0x70>;
> 
>> @@ -871,7 +902,19 @@ &usb2_phy0 {
>>          status = "okay";
>>   };
>>
>> +&usb3_phy0 {
>> +       clocks = <&pcie_usb_clk 6>;
>> +       status = "okay";
>> +};
> 
> This does not work, probing fails with:
> 
>      usb_phy_generic usb-phy: dummy supplies not allowed for exclusive
> requests (id=vbus)
> 
> Adding a fixed regulator that serves as vbus-supply like in commit
> fec2d8fcdedaeeb0 ("arm64: dts: freescale: imx93-phyboard-nash: Add USB
> vbus regulators") fixes that issue (and my USB3.0 FLASH driver is
> detected, yeah!), but a more accurate description would be better.
This piece of code in drivers/usb/phy/phy-generic.c [1] shouldn't fail 
the probe if "vbus-supply" property is not present in DT. If 
"vbus-supply" property is not present in DT, then 
PTR_ERR(nop->vbus_draw) == -ENODEV is true, nop->vbus_draw will be set 
to NULL, but won't encode error, so the dev_err_probe() won't trigger.

"
259         nop->vbus_draw = devm_regulator_get_exclusive(dev, "vbus");
260         if (PTR_ERR(nop->vbus_draw) == -ENODEV)
261                 nop->vbus_draw = NULL;
262         if (IS_ERR(nop->vbus_draw))
263                 return dev_err_probe(dev, PTR_ERR(nop->vbus_draw),
264                                      "could not get vbus regulator\n");
"

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/phy/phy-generic.c#n259
