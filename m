Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4903B38552C
	for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Sep 2026 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789245200; cv=pass; b=t5Wu5aRKtYic0caIKnem3l5nTIDrpNiUWgXR1Mm/MdRCIf/ktKGXyi8j7g457YJJJhjJilJSnO144Loza4YkqcJ+wP3tK6OooImk4AYeL2qfg8B5OAPZ4AbCekhEskX38IktTLoh6Pk5iU75VyoT2MpbhYDoDt6+NuMiyTSbkUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789245200; c=relaxed/simple;
	bh=rqyBuqSHWVw61RfLl33rH8YgPC33rT4HhMMfaGZOUmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFFHA6eo+tsrvwcydFX24/XE9aZ7CSyf0nTq2tESb5MHLQUyq8334SdfRBSSWnx/C3Jt9vEgEX/70fVO3wcptnWg3XjiFOHWHo78m3rJDcLVeApZubm4TcGe8tovglvrI3Kc0uleVgGYU3GpdNI5PuPBtkeTxnUXy6rpHeO7Gjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jbjo574P; arc=pass smtp.client-ip=74.125.228.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jbjo574P"
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c299e97dc0aso8509166b.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Sep 2026 13:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789245197; cv=none;
        d=google.com; s=arc-20260327;
        b=r5bAATS36oCTsKBrKCsThFrVziw/BJS01sMQzlVlhjI4YX24cAanGQpHlSL4v0UffK
         LyrHqUjeB4l+aFD1JRHfSKaE4lkzXXlcSW05RIuEdo0YbnTNXhc9HVP9eGtRZnhab3mm
         g7qZ5Z+wSzsn5v3I2+L/59E4BpZ+Y+rAIfzuA5DeYTrhFLtDyWTH8hYrPl+HkrLpF+NN
         IhMsRhuLLhPxuz9vHxXn+l+luTknESLPPXdzNa5gLJ9dRFrUZxw8aIOKmy+QVzu5yi4G
         ZVrlKfR2mPqlB0y5t7fOzNQlheOOut/xkrCBCpK7HC6H+/2DX6HhGU6KzuQVyC/gFQkO
         g7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        fh=Dl+gGo1AtF807jXi6vTUL9nRINF0Jjt8uo/gtXJxIfM=;
        b=QNMAmmRNyhPkPhC/pzo0mP34Gi/u+6mebRBmh1TlnUxEfVRMEZX0qhW+gyaX36Bj6F
         RRDCbG0CdoymN0wpEQAjbLqbN6WTwzaa0NL8HM6f6Cf9o/zNYg4xUFdQXPICLQLpgo0i
         AlO7BixDwqhpvAlYIB2L14XsKMD0ntPUWQrWbc4X4JEwGfDgNCp5gczUIYiY1+8XAoNg
         34zHg0MbWLaWvSiOBqckAtNq1JjIMSZrJ/xU2ha72dXeHMMkhqIyz5D8L1iD8BdpYrcW
         R5PSa8f44gHhede2u3di61+vF9YRZ5Q0t2PkpaJNiQabP8PssCLhfWcuOAxzekbU1Qdz
         skyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789245197; x=1789849997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        b=Jbjo574PeTwU3+ByMmD0BDF3eHeS+YkszMRg9Bo7/IIlHtfBp7jgOLCGKQ7+5+1raM
         fUqdKA0UE/3fwUTp4r/6j/yU3C7O24396HMzfdE9XC65WsHanQkgjirPppgsGFkcdgvl
         bhlgEUqawkFA1HR0vwDkl8c8DbnKmwbzmX/U6dh9095SCPvDa+NcGEzbC0cuf/Ah13XL
         AUTfaAd8hqJbArhLA9GWAX7vPXVAPRsC5K4PRaphHqNMD5424cAQlEE889b1JNP8+8r1
         mg1+L92vDMS1CO3hlBJoqQp6rUsEWQ83E0ya+3hFyICO5HQb9w2EK5ey1CSwrfvq9CJm
         U6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789245197; x=1789849997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        b=lCifIffwhhIGtrgI7iJTxF+wv1CKdCJr2qFgTdgT6iQSQfLllHCmTR4ynkAPRrDYNF
         Oj5kXTzb9JOYr5wyCsRcrjWaTnRCeiydYSqOk1rjxgL3bOq/LP75qYo+UAoYdQFJ450N
         YYxTLmFQO2/TZ4WBzER5SMtf/2x0lA3MRF8iD0x+tE09V0cMATKUjR+kWZYxxU1q2Wyx
         5irqx6GYtI932O5GZh1oISgQvHvC3sWrddguSU38pOT40BCmxBELxfCLOMJ3Tma5AUis
         OKFNLmciHWutdfWjxDgzwSleXtOzh0O+/4VSUBsYhyh5Cu0YSuFZtJpM3sic+WhFj4uK
         0qbA==
X-Forwarded-Encrypted: i=1; AKwUvBxL+6Xn2MGSnVO+huGGOqvraDH4nBSFO4AOqNFPSiHxkQK69bGTpu7I4LjGAkonfxnTJ3Wxq3QW/OVXB24sv49kjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kA+8cvJ+ympdjTAPYOq8UHHMHquzmU9Rt7+8BKVDboENbi19Wt
	XPCL+Q2/e/ehCwz73br63kLwBp20y0n2IEVXNhvhOJJIBpa+4hPVYbwiRpP9iw2BtayzAjwC+Qq
	fIUpD9vsA514hxz66Ws/F3xbBNSgEsuc=
X-Gm-Gg: AYBFou3yvL6eiSUwAHhDg8tQVGxiU+tp7eBfO2/t4+h3pIGP9hcH6dXKyNs1M5qc/5f
	56q7+aIjvWFzZN/DSnIkAICcBFJE1Wn1PjyisWQyQE+lksIlYxGvGn1kgxpb94QBqQFZtXF+yTA
	rItKXb0bRHfqCFe4f36B6zsUyonuuBiUqWgBfSdvt9sFdTeuI/O6isjk6+wB26HgHmsjravqX7u
	cOPifZiOXUL69XBowC12/1wzV+LplswFJf1GX/H1vt/KuXHOMJP4h0D9kmr75yTJEmWPUjF1tSq
	Zu/gM5LtyQQ5duCOThRsxilzu585mh5tvw0fSUikqfb3WteDf5g633yAkQ==
X-Received: by 2002:a17:907:d02:b0:c25:2a78:15ed with SMTP id
 a640c23a62f3a-c296659c61fmr976523566b.6.1789245197295; Sat, 12 Sep 2026
 13:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153713.2572547-2-coiaprant@gmail.com> <20260912131421.2960a12d@kernel.org>
In-Reply-To: <20260912131421.2960a12d@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 04:33:05 +0800
X-Gm-Features: AcwNN1Wp1szdgOCnvhL-ujyIZJIERlGVxaN0L7OfiFu9TcpEfz4jyCgcrEH55iM
Message-ID: <CALj3r0itTv0+8R+mTg3wtMD95=4V3Znwsk48oxaSjrVMLoJfJA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 00/10] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon,  7 Sep 2026 23:37:03 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Sending the AI review FYI, please look thru it and judge if any of the
> comments are worth respinning for. We're waiting for a review on the
> device tree bindings, anyway.

I apologize; I have been so busy this week that I=E2=80=99ve repeatedly
overlooked my plan to reply to sashiko-bot's comment. I will get back
to you as soon as possible.

Best,
Coia
