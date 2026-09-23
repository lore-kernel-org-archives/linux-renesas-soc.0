Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4462851DAE6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 12:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167251; cv=pass; b=iduVpOfGvuvxGnQ00+i+CMkOVYbSapBaDwRIc7GXigrvFV+EDo39pC0vTY2HALggSpjZhvcIY4fatA0ZB0MNyNYuPeMnAE80UnBj9zisidj3vgpeGuPaH3VkdymVmWtkFjeIsCWjHC/zfeh6hjElkP4mzFiooetW/kkZyLgWvaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167251; c=relaxed/simple;
	bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pA8RzDDGdk+NjOQ1rbukakh2whMjL/79GKf43JP6Nf5SQgsyg1Y8p7bNlplu6qJQn1A6jqQsP8AttK2zo/6SvtHfjS/nVTWg5V3+pg+4lUe69STLLe7k+fJmcQbur5gjwI/nNOsHUTCyuecg7RniPwO/d50TDsqg69PlNg1k6T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNVWlYwM; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNVWlYwM"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c294716dbf3so53489266b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 05:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790167245; cv=none;
        d=google.com; s=arc-20260327;
        b=iNHY0E5GzMzad6BsLGWxAKjF5JBfVSRXWDFyAqwsL1wVhFdVbboLatfxytDW52/oZ5
         vcDbBeVUJg0dYjPRs4IssLhWo4lh45UeDcROfm6Jul/6kkYdBCUfAX0YJ1LDVTdbdArT
         mZky7OZwvDGbljv5K3rtfemqB9y+ZXncteoL5w7SYxWRUeCGOk4nyaAYJZduKZUpIK1c
         bZYCbR/mPPhR7zI3nHhKhsbcSmtCHlGlWKjgagUiJfhZYEv58XmAnl454aM7edAWSizZ
         f+SxOpSG8tyn5ytHNRMUWudA+OJu71iw7fwfDgu9eHnYON3Gv/5qaUM2Xl/saVH0GdTC
         V9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        fh=+CKV2ktfzCFd0tE3Xh4FljdioUyboYyQC0ztjerZ2lE=;
        b=TkdgMgnfhYhHwmLwlBKhnl+McgOwI3e2yzu8XKF/ZRPqjmeWxff593y6ultVMj6UlP
         yxoqwCc5RaoR9eczVkhJ1oALTsg+m3Yqhb9SxsArUpfWldBhfyJCUuizFo/PI7g1EZ0j
         EnOhzDuhu01NQbTD5wWDnczVAwkgzuFs/h0Ydr/Twi5Es63D2Vp7/g1l2zJhHYSYzQEa
         FncdYy2868KZMHz2g9O0ZS4KJvsSbXvoRyAUpgpf8i4DM7GMKQlNjWyFzS0SSbupmkGz
         HoE6L9/zuDzOdoxzd5tOGUzxtWxijQ1tBQYyyubGwf+65yxSv0PXslNMZskMezbvSQqs
         DSnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790167245; x=1790772045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        b=mNVWlYwMzpZ6XdVh6gnhcylaxl51TIH99pMipEXYbsjdb6U3HyDy+7+Mux+yYlrY8n
         tAMNUR3OZJ2T4gS4BafREQ5OIUX179JKOOByjFTUWb8R5/hcungUbho65yJ4rV/SNOhP
         0ajiuf9kM2THHOfOP+UFYk0R0vS3RM3arQ3y/MaID/B9K1FSPa8TKjGBrYfgZniYWZ8Y
         WOBi9fi7Eem04EN4bjBeAa+WDy8b939piz+ce1gfpLa7MgQ/nRFJtIS/46LlwWKn7uca
         pALtLSEcy8N93BTGd2Vd9A/JGwiFYL4DGiLmkCbK3sCoDr14KK22yikj5r6/1s3poe+p
         AiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167245; x=1790772045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        b=N9AXl1IRe+qX/WTsy6gNAiDGIiOuW79FcYPWQ4Ot4Su7GH2cS5e6B8Zd8fkSSQRlTe
         Pad6vFSeYmdQMHW9cGXvbw95NGjeUAFiG0V+kGB33SB2/j9XINUEHrBOMOr0cXlZQM5p
         gFwrnKaZtIBh+Efw/su3a0v4QqishOS7dTTidlvKnYefU0A4hQFz0zuotpzddAIoHu0A
         refB0TShhKPtrmtQgY2EOV+pd4NoLDIt8lXPb874GjNOxymURtSSHCjfn+jw1hbaT+oW
         kvaE5U3Tk41rqOr/A5RAyANRS/pM7zjxo3wh73bZCUAlvtNB/CgSK9kfoies3Qk0h15+
         XT0g==
X-Forwarded-Encrypted: i=1; AKwUvByWNGpr2f9k2Enjp+/OkZOhpdusXAXdbzxM/iKBHYXXvHmmfOeqzCb6XJ6/fXamM7RRAdE0qOryKb1XmVC6iX2k9g==@vger.kernel.org
X-Gm-Message-State: AFuF++n8WFhj3WAI9F4POyzt3eMIFAnpE+JuJBqqqnEh+aEMZv7P1HJH
	yr822bOTQn9I4RBxC7/o5vdTSJ4BLBV4TA91iscNF8lLUPjZQy0Vp7ebmclf8KktlhTQbz1vpF2
	tGG9Nfr/nGB2VuHReuNg0g+Ae4m0LxKQ=
X-Gm-Gg: AYBFou1z03BczXXvLGjAnCjXO7jNA+4ox1ZkAPT9/iD+AzvjxzFGxkBOJBrT36Lq22Z
	H9BnflZIM1XAmnbkd3dLtqzkFIGkfA4IqCN0Nw3scXO5BWgn38gAwQfxeMrNWY7QuLq9T0Mc3Oh
	e7s1NCjA54xKO35L+PLsrNWDzY1qM9zSxXOQzcDxbrHhA28O/4GjG66N0qDEthFb+gFHW4t5aK7
	XDgFg8BYcHksMTE/C2kfnCLABG84daf0xavqh5NhHVzHshMBf8tMXm6Q7+OskOGYevg5AV3/Vri
	fCx9JT37Gx/dGwW4b8+fe7M5aokwc6woEQtKOjWVVxwB3zawvqWzYUTV7A==
X-Received: by 2002:a17:907:d91:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c2aadcf4484mr194861466b.3.1790167245181; Wed, 23 Sep 2026
 05:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922195006.79890f24@kernel.org>
In-Reply-To: <20260922195006.79890f24@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 23 Sep 2026 20:40:33 +0800
X-Gm-Features: AclHuK-io9PS85iIjo2RRKD7nlxq4FY18LSW8xzP9gnGJLLZJesN4MppzV2qPUE
Message-ID: <CALj3r0hH6m7jUEweKMWGmCW9aOxShaqsV0E+z4ztBhXbJ+378w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 00/11] net: pcs: add basic support for RK3568 XPCS
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
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=89 10:50=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:24 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Please slow down with the reposts.
> Not more than 2 a week, and please wait for the AI review to finish
> and be published before you repost.

Understood, sorry for the noise. I'll keep reposts within the limit and
wait for the AI review to be published before reposting from now on.

Coia
