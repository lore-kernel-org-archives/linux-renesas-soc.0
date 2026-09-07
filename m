Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F529377558
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795042; cv=pass; b=OToRqM7f/vAVluCknZnOTnBk6XAmb1zEZryTScso4czWJMlKVnG9CxmpuPanwvER6K7G01jkqQJaYksJeOEi/f85DabUZpJmKq8emVnq650bHaZJDUuawsj/Opr8tuc0LdKSW2lGeabqvyqYElccimnUjSaaqpg0Qe9b4fEvdTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795042; c=relaxed/simple;
	bh=lGFXfZ5XuVaxMLWoh6ArrdyCudpeux6klfmVJa5bp1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RT8sM0SgFmUZ10DCGAMWy4/RRXNg/m9mKr8WsBFFufGj8UuHoQjYzKMUYEj1WExydDAsFiSTcBl4YDYEHoKMnrwNOfKjPQgdq7VwerH5cqY12E0yEZpLXbXP9Z85ojE7jWYWSfAiGHuyKmZATlzPKZ4o21zeCX+Ipb8ZATweQsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LITXYh8/; arc=pass smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LITXYh8/"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so7641739a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 08:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788795038; cv=none;
        d=google.com; s=arc-20260327;
        b=ffw5vQVpl1FK2AEDtH1YdHmP9q14fyOXdeTfu8yKr/wdADOBNlKXJ4PvUCbKiMSEkj
         0AotIWfY3vdhhvGeAOr0sLdAoZDQmV5x1BK6ApSOhNojTU4aKolTyC906O3lDAq5V1nr
         zxflVWfKIE/xS3DMOVE3iGEhVhZC/vylhksnqRzZywmfne1JUwfi4GXcq6vSKAiH8izw
         ZTg/hKFR4dKpPnwltra+FasFIDnx2dRbsthYvc6PHe4rTXx95Gb81QavFX8Mhw2RV0Qf
         Ai7dbyvMYk/BledtyqRw68NtCO0fS0ndIh2uY4Hh9LMwa70UYeBX0QrwGbeVTKebmAEb
         r8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        fh=PExPRIEXNBwgQoEJTDnt/0G4j+/yVEvJpN5jkfstAE8=;
        b=ddAkP2asu1WFuqduO6OGpLAlgyU9KPWdj1sk4HTGlTHmSbYSCKnXOanb3Z3jzcJF9h
         qT04kzU/LqRzMY1doyN4ssrkw9vdDrixfsEpYlybdhSypsy3iZo6WqXPI4EH6uEH0Gpx
         tKpl3czP8NUo2Hp5rwpVeX/T8YXWNKpJ+AONoQ0CozLm/4svTW4K0E9kAXvUBbFTzd3T
         I4JE3C0OdCb4344j2ixwsLg1X71niARgrkDjMsRbDbX8GRh3mAIYBT5mmSFv0JaNxpQ4
         Xk8QZc05glxR4cD25DTY3wPnakq42wPGK+Ujoyjqke1NsospvR8Qlp1lt1+YGVBRICTH
         cmlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795038; x=1789399838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        b=LITXYh8/g5jBcACk8ww7y7kP8DUvXMLpAXWQoH+pL7Z9JsrTxmZFKSH5qXMLtfVQAS
         xdvBiptnO/LVjT8ugblS40pN5QMnkqGbixzUP03hWZ7fJTJNYuHpyNBrcBegG207Mc1w
         y4kT5xuusKl/KWJdXuL3FVSshc+iJiXpL/evtAVxtdIqRwRLfWBd54MP0tYr51b0GTdw
         Cb3PSKavDX5ylT4SEeB+lGjdkEqBrSIsSQUWttcGvxbIUlR0hUB8LQ7lY0dTKrqTtXcB
         BVfCNesZgJWGrWrNLE1uZCD6nvS6Ir3oqwMr0VmEBs86Y7yvRBh9V3ejAY0VnmKt8mkZ
         oJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795038; x=1789399838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        b=rH6Cj4PnOmzZuUTARdRQwdaM/JgX66K29h2u6Xdh3NGgGLImKbYMovpN7r67BhrAYH
         FcPDOHIks+R7xNpIEJM31eimPXQDdfGzvk0T74ldVg+nNzUyVwzKH8FHcQd8AkX827sy
         u0l3LNuYbHn90wdDU1343QsTy0xzUsmvPtNhOJWkWqY8bMc17CCQuXgYVz6OPEINf7jG
         SMEyhvMTIKS66Uf5QmbB/UWsYtftknR11TDDPF+IUbgApvEUzv6oJoD1Zksu7bO/8hBG
         TiJkp/ciIm/fCaifX09AdxZOPkfhvWnCy1o4vFRFODV03kNgEMC4GPeqQOLATN3fGcF4
         hVyg==
X-Forwarded-Encrypted: i=1; AKwUvBwh+FOmx1vQwiiNmCpcL5vQBA2DpmXB+OuW2iMpwMsvtPEZFbSuuhrsj9S4hOjg4T0v5ToRYJNlBC3rvoWYhsypdA==@vger.kernel.org
X-Gm-Message-State: AFuF++kMOdfFz5h2RDbHxrGD2jH9/w3QopgQAEozU8Z5XBBaxMG5o8bR
	Kt5edjnlaXR/6jKGLDyD/xzp/rh7++JmzkEevVt9w0JdpHQQ33G5w+b0j8FRYox1e6ks/q3rcit
	xJLcC3xToRFO9UCR+wOCzrnhewPmMGjo=
X-Gm-Gg: AYBFou30SMnhK4dFEYBy1qgXFiKv1YfkYYNgX6z1DOGb2kJqyhBfNyNmVBopIEvPQf7
	sOkrUSvs3BXd5ODhzGRVCdFPXAWtEG2KyYCKO5zRPAt4Z4nnzA+0cuqqZRl5Y9rpVzOaIoRjZwk
	NCU2VFvC0oqHYIihKPMwhNnWCSaMMm+K9Mc9raM5YLyN+bpVmUkAP9NW3ZasbDlEV9d7H42bUao
	oGDaHUHa8PfdtCzq1cEV10lYUx/EhIuFaKyY96nQAdXWWh+esS+q0bqHysOwXeAEJyulkRU7+dx
	8IhZWLAQL5ErAZ/PS/FeY3xTSj/0L5AvVLvpAsiC8QCcxpsHHbc8HlarrA==
X-Received: by 2002:a17:907:ea8c:b0:c25:4d9e:bb28 with SMTP id
 a640c23a62f3a-c25efb68285mr1154227766b.3.1788795038010; Mon, 07 Sep 2026
 08:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260905130002.554a167a@kernel.org>
In-Reply-To: <20260905130002.554a167a@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 7 Sep 2026 23:30:26 +0800
X-Gm-Features: AcwNN1Vvl2lnQu7OUmDQrL2TMEu35axYNEauRYInB38b5Eog8jJzDQ2t3ClFiz0
Message-ID: <CALj3r0grty9-s5FoXN-SHOrLkVoWgW+Ot5nHs=1wYzxV3hbC-g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 00/10] net: pcs: add basic support for RK3568 XPCS
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=886=E6=97=A5=
=E5=91=A8=E6=97=A5 04:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue,  1 Sep 2026 23:01:00 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Not sure if this was already reported but FTR this series
> breaks allmodconfig build
> --
> pw-bot: cr

Yes, it will be resolved in today v4
