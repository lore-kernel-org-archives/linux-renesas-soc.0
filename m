Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03E6285C8B
	for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Aug 2026 03:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785641302; cv=pass; b=dSX6XcPdiln2cHeuHTWJRy8jYjl9s3AGxlc4FxpLsG0Ymqrfdh4EugU4+trE4Xz9bx5fFFIXkJJPsYrfQ5EkYWbwzlGBTjGCzFoDtsKSOASFfqolKXfph6dbOgrZJ4Vr3vDN87EAOoiAb/pwKyrby5g3r760TPAO4Bmcz+LOJIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785641302; c=relaxed/simple;
	bh=/0w0YO134zBV85YwnHp+km6pCsaY5x0vppPkNuKA2EU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGto3HB01V7dZ0KCQM5IgMkR3nsBpO144j7tu3AH5ExrdqnZMbb3x+VzJqa/XLwitcdm5OW4PLxULJAuwcj6cOwCM4PfNt20/Dauunj+QnotVJWJvwzBuj7UAqeTwuQc08GtebiGSx8KCTSvctAuKjvsZj0X5jaMdCBmvCorQrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYwSs4f4; arc=pass smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYwSs4f4"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c1971f5efc3so109439066b.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 20:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785641299; cv=none;
        d=google.com; s=arc-20260327;
        b=DtriUgbtu394sZEY2CyXy0M40mlR+R21Uu1h5bcaZt0BJq2Wt80zMQixpvPILJsUUW
         ZifkG6IANy8V5IGe06yMB7nqWiD5s6hEcrThxO8dLaQDK5Wna9BknCveMQketuWzP0tw
         lIprAdSl8+flFTezv4GSCem/9cN3S4CVths1Rq1i20s2i4goRLpeMwy3osp2VJoZy0wl
         H3d0lvVnPhZV3LkQ2kn3VRk9cRZzxGqH+lZsUP8PmxoyhkifM+znfRBea9tZReC4PkJc
         jbkfyv5JNgECREeNrZk4QH7QWpmg2oFLit/kE/GyIffzeAWla9JZl93yAKwoLC+1GOUn
         UtiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/0w0YO134zBV85YwnHp+km6pCsaY5x0vppPkNuKA2EU=;
        fh=plm8Z5W/ZWiNdCjNPHmGh7QJMYzNvgg9ue9qbkKRZWU=;
        b=Vut1LCV8+SqfptNaEtxrt7YlBrz+6ZJDo1u6WpPjZeXgWN38zoEEy6jUtr3PFk2xOI
         d+FqI3hwv75ntPCSYtlqXBWHJolKYxR8VrZJlmJZlw9cE7q4gTylonhO1kLWBM8P0vpv
         A0IbWJzI4bOzx4X1fs8Ww4qNJPrm3wnzxG83zyb+oPOKT1stkn+4+pZtBDG4wGIXKJuG
         Bp92USi323XlobKjRw5jWL2g/BIB2zhjWPNbBMo1nB1oVz9m4hWDxKXDAzt86sCWFzE7
         EfpfrF6hqvYC9YZl/IiwWB/rgPY3xZwjcnJxP80GdLI5z2j5/vZmzcThN6NjCM3ni8eO
         mglg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785641299; x=1786246099; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0w0YO134zBV85YwnHp+km6pCsaY5x0vppPkNuKA2EU=;
        b=lYwSs4f4QRVNApHpA5Fbhp2sxug4AuEXuNJXpblaWPsau5ckLJuoebcgMXgilkYW6r
         01VJi1tWXpw8fCCm0U5/qoWHZ9dZuZPRS9HL3Q9H86+0fowVsyTI00+HtBWXcwKehzho
         q/NwpTsDxXOa1KFvNVcBx79ISSJN3Sv9ChmFnHZa3cof4Mnugoe08/U7K7zjMaXZoHSe
         MxFR1aD/W5nbtsYvsT24JSkTbzXzXWXf+5x8GgEYVzzHWfpANXJhvZ5IsKl3c4+/kW0D
         xNkdiyAQAaQGUYpPwUTHsEhGkTjAogV7+wPIinPeZgmsQ7vyaMyQJPgLVLLzBvR/GHaP
         SOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785641299; x=1786246099;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/0w0YO134zBV85YwnHp+km6pCsaY5x0vppPkNuKA2EU=;
        b=Xg01wyoLkzzQ2WcH4EVpauNcabjSG5FpJk+vCsPc3wu8X16XegfTGpDKH4znpZyoDG
         gPgEZ2srCnpG05MrQxJ626A/S79yjUn9h/x31m3db2gfDLOaEEcQb/FoMHI7wB7dD0NO
         Ys8adkwaEcpvz4wAVBKMMOVbsyA/TKiWwYut1Rf/2teEkkVSxr+/yGzcH0QjJkWsOn5S
         7ZPh+5Z3qLkd0ufDHxCfSAbJT8RhvBmi/amYFbrQK807HKjfj0NWSjd9yM89r2v9SdL3
         mMr024jofh7hKk1/B/M9Len7/wf3pbckZjqRdPjYi+5z2Ve8zE40UTDxZJQjgQbzQUJH
         g2ZA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5b0uoAmB+mSxGCZE5s+xQ07Znl9CzOIfES9QTJ68I+YKslcVZpguc0YXom2GCMLtrsAzar4c7kA58iCGE8/oKRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/khXguJ+283WcUD3HeJC8lxdESYdI/JM1Zw4kWSqWSBalKPcn
	pXXFNs6h3h6Qg0KlyNjy9hqLchKmXhgIIUXAF+a5SlKYrWSgKDI1j4hsrPI5lCkCyO9UPv0H6Al
	sr7FThAotfXkL4bvsB2+/0ffE07PEsxE=
X-Gm-Gg: AR+sD11r4L6J1GOFHQ6XswaL8QfvzCRqMh2Qan+8ULVkRne5e1zeTuavkO+d6If25vk
	iY9IY3IMqbBrt18wFwcvZPFEHBLrvrX1vxj64f2Is3m73+H2TtsQChmN3wEVyTWy/AjkfxJ0dl/
	6/M5S3NRTurbh3fTAuf2XC31RKRhmCNWx5puS6bDkQUFPWDAra3oUy9R6+LHrkTqpUd1ROEf/HK
	yWRdsy5mLZkC89Cr+s0deQO7Ar4rdQCoPq6GwWbOnxyRDcJUf4z6xcR7p6nUuGIR/iFM67KWGF8
	jFrq/KdbvqqIxXAPmNmhoeoETRKziBcP8OeIh/Ur1xIhp94KEmQjN+dxznA=
X-Received: by 2002:a17:907:7b9e:b0:c20:768:af62 with SMTP id
 a640c23a62f3a-c200768b973mr9148266b.22.1785641298865; Sat, 01 Aug 2026
 20:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-7-coiaprant@gmail.com>
 <2847036.GUH7pLUipS@diego> <CALj3r0gqvFZPb2SKRMPwf9chCx076rwCnXEoOMFch_V-fOKV6w@mail.gmail.com>
 <0e9d16df-7332-446b-9321-ce3de3111ffa@lunn.ch>
In-Reply-To: <0e9d16df-7332-446b-9321-ce3de3111ffa@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 2 Aug 2026 11:28:12 +0800
X-Gm-Features: AUfX_mx4aMsgyN6RI3IxSSP4ztvHebSR5krnQ6YdL4RSbunpB8OT85Rvkz3cx3w
Message-ID: <CALj3r0guMmNRN4EBbKz7stPNMSqkLBvms643YXBEDMzqHHM=FA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Thanks for the detailed questions. I've looked into the clock tree
more carefully.

> Do you have documentation for these Combo PHYs?

Yes, the information is available in the Rockchip RK3568 TRM
(Technical Reference Manual).
The relevant clock tree details are also mentioned in upstream
discussions and patches.

> Can these clocks be enabled/disabled?

The 100 MHz input clock to the Combo PHY is a prerequisite for its operation.
It is generated by the SoC's internal PPLL and fed to the PHY through
a fixed divider.
It is not a gate that can be individually enabled or disabled by
software; it is part of the
PHY's fundamental operating conditions.

> And how is the Combo PHY fed with a clock? Does it have an external oscillator/crystal?

The Combo PHY is fed by an internal 100 MHz clock derived from the PPLL.
Specifically, the PPLL runs at 200 MHz, and this is divided by 2 to provide the
 100 MHz clock input to the Combo PHY.
So, it does not use an external oscillator or crystal for its main
reference clock;
it's generated internally by the SoC.

To summarize:
- The 125 MHz clocks (xpcs_gmac0_clk / xpcs_gmac1_clk) are outputs
from the Combo PHY.
- The Combo PHY itself is clocked by an internal 100 MHz clock from the PPLL.
- This is all internal to the SoC and does not involve a board-level oscillator.

I hope this clarifies the clock architecture.

Thanks,
Coia
