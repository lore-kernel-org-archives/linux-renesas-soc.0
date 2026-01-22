Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C273203A5;
	Thu, 22 Jan 2026 13:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769088566; cv=none; b=tV8jcKYHc5VmKGW5Z7HQqmDhMNOBC9UWF8G0IZTUcjrnD9K/umcdkxQJetijY2eWsLk3wWjoARVn9qBkGfWahZdQuaqCtM3o2MuIzXgcQ2as6NEnrNrWcB5xlYRjOdx3evLyq3sGlqzJL1Ku/2qavLY+3IUU/nbOl+7aBTRAn4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769088566; c=relaxed/simple;
	bh=325ba4o46Cow6MnJkg8huND7CIliehO3FV6tV8n+gTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I++f2zkBD5Gg2Lx4Nw2KA9lzpc75LNwPIYtXXD+KflXfyZ+B+NOZR9vnJ7Zim3nDn7EFIYXPeyl5/auRF2OCo3BykK2kTd4WWUqlmePrWESpkOeOQgZ8MLE2DVclSSzYmVXZu6uqnSOnK/C6YWS1UgIB8fefwfLhpHkbEDGX1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=q9Wk0t1u; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="q9Wk0t1u"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dxhjk6tRnz9tSr;
	Thu, 22 Jan 2026 14:29:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769088555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qkXDurj6QKj5E3C55M4uNbxmil0lbV8rtP0fhoCy6LQ=;
	b=q9Wk0t1u1XPJNBO9SXrYKdYBt5X6c8SFwWGYF5O0qc8XUF8iTNz1rByWOSQxlmYUiVvB5w
	21+RfUKCHViICtY6bZd4FjsNmRqXXxKJh8/cDrqjUj35wcpYYgtRO24IrTfZdZCPNkCGOx
	VC+DYIMpH0d/xd/sQgQvTmkCw7akVymaEL0UFx0gIS4a94ZYJCDHfdw5EAvRjh8cGICBuN
	BH3eMNwjFwSiGiJMifCroRrGRhhkvB05FrCpYxZZ3feiaAjpu2EqxjqWwm2ZB0Cx8fYVBE
	fPDls95XPk1pEW42syvEupExkh8qxCxpTQ5wx+GscR9ozRdoR0Zcooaabrmg1g==
Message-ID: <f577f6a3-0239-4f73-9d4a-60d4dea64955@mailbox.org>
Date: Thu, 22 Jan 2026 11:56:48 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0
 clock generator
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
 <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
 <6f817993-1b4a-4600-a771-d6c25efc668b@mailbox.org>
 <CAMuHMdX0iuyUhGRPFf4x==e_ZEMjaB_dP6mrM81F+yxqwam0FA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdX0iuyUhGRPFf4x==e_ZEMjaB_dP6mrM81F+yxqwam0FA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: dg9gzba7xrdauthxgmgzntyeydxxorzn
X-MBO-RS-ID: 29de373016d6a85001a

On 1/22/26 11:24 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> This piece of code in drivers/usb/phy/phy-generic.c [1] shouldn't fail
>> the probe if "vbus-supply" property is not present in DT. If
>> "vbus-supply" property is not present in DT, then
>> PTR_ERR(nop->vbus_draw) == -ENODEV is true, nop->vbus_draw will be set
>> to NULL, but won't encode error, so the dev_err_probe() won't trigger.
>>
>> "
>> 259         nop->vbus_draw = devm_regulator_get_exclusive(dev, "vbus");
>> 260         if (PTR_ERR(nop->vbus_draw) == -ENODEV)
>> 261                 nop->vbus_draw = NULL;
>> 262         if (IS_ERR(nop->vbus_draw))
>> 263                 return dev_err_probe(dev, PTR_ERR(nop->vbus_draw),
>> 264                                      "could not get vbus regulator\n");
>> "
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/phy/phy-generic.c#n259
> 
> Sorry, you are right. I missed the PHY driver ignores the error and
> probes successfully, and thus didn't bother doing "echo ee000000.usb >
> /sys/bus/platform/drivers/xhci-renesas-hcd/bind" after /lib/firmware
> became available.

Is any change needed to this series then ?
