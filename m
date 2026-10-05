Received: from mail-ej2-f8.google.com (mail-ej2-f8.google.com [74.125.228.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9275B2D0605
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 22:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791237707; cv=pass; b=fCsJJomA04i1Menf9SDzCGgmn3fnWRxQzyaCUqQWmu3mqoCpgESd7YUbSAmXvUtGK6YSb1FKdzbO0WqKMl5ejmeHJW1Hujfcwunl2O+8woCA0ukda7VJ7Gxa0IYiWTIFuxRuATQtjBJVxte69A+pG5kQvhXfsqbYKyJKCjjSsZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791237707; c=relaxed/simple;
	bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M39ZYr05P2PMPv3h+Yp9k+Bb3g0v8I6hnGnoJISawu92DyJn+YFdrJhduQ65CATRgLVTQ5JgObjHqEmjUVDAAjOdGlYk0/PdE7h83YDvF9InR79cdyCk8t7TjA2Ga3ROr+KBg1enO48P9Ex2OwlRrAE1udLvnBIcjScO/fotgqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMVISnrZ; arc=pass smtp.client-ip=74.125.228.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMVISnrZ"
Received: by mail-ej2-f8.google.com with SMTP id a640c23a62f3a-c2e61353ec3so64525166b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Oct 2026 15:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791237704; cv=none;
        d=google.com; s=arc-20260327;
        b=GGz2mBf3enYFGCmkpern98f+xde2iE6oEx88Uoijs8XlEgVtb5BFbagnumL4POB8zo
         9oZfUh1MdqCBBIUI+mz/FDsZ8E4mQNGZ91Rgk2w+duXQHJNEMNPEHseGRort1KiPp7gx
         Dgal3iZOB4BaxmKw1Hc+/q4oVcdrDFSbFObE/FVFgnvZMJRcyWO2XC/4A+K6Z/NJw5iz
         25vxzRQUfEL6Fe13j6r4UD4Na4ddaKEwEAMN/kYyc3oQEM21CxX4b0Yi1PkwfaM04sHT
         tCvFWsmFJQk2LhLsyeEfnIVzT/iQwEz7538sTvGSNSE6fQgjEw8di8vPvlJTAOF0lvTr
         xdSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        fh=EY5nMUg2wH6TMGCV6w/eYv555aJ40EfzVWNdnlThMQA=;
        b=RTQS3GWlyACMVrmetD+nkaN7klVE3y6VySyF/MKiDGl+AuACwgpO5lnHE/D32tLHsy
         OdGM+F8JVvOwrty4zjuomZn/uSeKT+ZCKOzLqkqdCFz4D7TWEaye9NizxJ240AFoOweC
         LeRIhpUK3CBt8B0mKBn4sv7to1GbinsXfDlvsOdEAxFC8bb6ghmSpW468+8SyCwaVodA
         19C/9PsKdj3bamy6tGIGz/d9UlQZRRLuBHJkoxm5Phq4Skl5wI9c4t0fJBUEoAzInLGd
         CwbBYV4BAMdfnHiEggXzQU7zOt5fF8juU2bbq618CNxpDE1zCpQpczSgP6vxYQg6KB/g
         auEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791237704; x=1791842504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        b=VMVISnrZL1wHWumoSE1JWHa4u73KOsWbHFE3G3orTGu7+JYRVCX3S8kMHXYSvdfG9Q
         UdXDeZAVvBHi1OkxNKzhjwcpEiVtfpZoUz224dn3W3H6a7Blp8+xrBV0HTEevbD7k/MI
         b1REuqdItszSL/27/2sEGqUGao3lb3DMzUog2l3cNvXJDBlM4ZTfpr5RHWofkW7EbEET
         fQlrRKaGib4KVSUhgdDFYIo+pklFe+IYLIiawdfQN6LWtnX684xmKOgcFpQAxFtzg8EG
         I8pKC7dGLRknHQO8NX/098ZPGp/FRCeMPHim1YTTvsy6AvSMnooyAvu+sucSvk7SU9Sb
         RPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791237704; x=1791842504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        b=OLasl0PKMZWURnGzu3DpqoqHNuVlrX2cVoF8eXQ+11otJZQd+fQDePCPDLa1hsEiUE
         YK232c3gqcdPzHawULtVCk4eRocriIGkq1p9jKLpT083KKcyvqD3XThS7z+9Ju8Y4bjb
         jrmxx5crtFNmKjXu4kNrsKyWblM+RkfC2E94VqbSDRKqiZS2yDkp0+rohLBjzw25ROSr
         a79RrQQbQ0cvBwqkkS46y45C9qfukkjXon8RPR32qx5WS4/oGNTNLxSPHQW+GEAg+k/O
         WStU+1EtTUWcQPu/mKf4aPBYcaq2u0qA5IhmTBr2EEe8zRrvZP0J1h9OH0EJKUcHg4bX
         u8aw==
X-Forwarded-Encrypted: i=1; AKwUvByHG3JKHaVGkYasdbvROB87AJQ5oEokr+DWCy5ak/r+de/huo7tNO2RZ3SPEkBdecdNQ5ZSdDmNxmmFKjY/GSLpOg==@vger.kernel.org
X-Gm-Message-State: AFuF++mO3iRUZdks0S+YrVLUjQ6qXTORdZUxikf6zz4iARdvvJRH1jdF
	P7UV7v270rlfgaB5fFzOTRIsqQdjKaxiPsWWjE5d/j13wHVgdZkdKlQXvYh95i6qmGlPg2UBnTC
	dp/2ofjTHGgj2Y6ftyQXmsKye2qOJk5o=
X-Gm-Gg: AYBFou2ll82AVFSY/+QccFqaLcL0opmNdBogOmLn+91pwRDw9xt3tz0YTGYeIGow6xl
	ZKLziaw1XQ/0e/GAkP57CzTm/YEaJtlPsK8XUAMxxBXtaV5vhv44HvZEa4XormfsRmvvBwmCRjC
	3Exzle4p7OADCbrDBvWI84WwooLOti93GiPYvc1kVNlN2wpsZ8UXJiiUwjt/OO01PA7cwnWFYJZ
	O2usVFWTSMiGSbbTg7oJbvEJ7eOBtMSg1+UUCLhBpJlXoW2PvW+WO4lsW+vOIm0pY1sC1LEHXVj
	E+67tBebAt76gQKvEkGxb/f10yuyDsAgDCWJxuFWUnbsVA4/iqXLAmiFjQ==
X-Received: by 2002:a17:907:2d92:b0:c29:f5d5:5a92 with SMTP id
 a640c23a62f3a-c2e4b007c22mr1011878966b.28.1791237703713; Mon, 05 Oct 2026
 15:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org> <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
 <asQZ99CMsQF10-RZ@parshuram>
In-Reply-To: <asQZ99CMsQF10-RZ@parshuram>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 06:01:31 +0800
X-Gm-Features: AclHuK-R2LsVgHnJjNmWI_vZ1n3RwcrYHA0O30u1dyI8VYXPn7GxP9tLow2x2eg
Message-ID: <CALj3r0i+sBhefWPqzt76OX+DxEZqzxg1JOz3d3te0sHzHQTV0A@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Vinod Koul <vkoul@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Vinod Koul <vkoul@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=8C 05:43=E5=86=99=E9=81=93=EF=BC=9A
>
> Typical order is that binding and driver goes thru subsystem (in this
> case phy tree) and dts thru the soc tree.
>
> I can review and pick these if you would like
>
> --
> ~Vinod

Hi Vinod,

Thanks, I'll resend the PHY binding and driver (02+03) as a separate
series to linux-phy right away.

Thanks,
Coia
