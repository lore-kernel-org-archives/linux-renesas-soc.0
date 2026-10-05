Received: from mail-ed2-f10.google.com (mail-ed2-f10.google.com [74.125.228.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F23E2754
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791234924; cv=pass; b=qjr45k7HKv/kW6ruAd7KTZSkxL0n7os0z3A5jr0copJ7UUzCfD4j5h1C2T77mO3ydLrnh6gap6WKbuyfwQRFqRSyQJRCZpvVLrnnPgccswV7tbnFl0UyADMp2nfLeZsmZcmAfNSHxT7u1/G78xPaLPWwqIFFYhITujz37cVVg5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791234924; c=relaxed/simple;
	bh=hqIWRi6Tpux/2qAc3lWZzGdHe7GnVUNYF9Jq8zwuyMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uu+UMe7acfyExyeQTOeJmvLjWNhvwjW591s/Tod5zrAHSCGmBBxvCO+Kpv2unur1oedkNmTDaaAqiIrQafvNxdcWaXA1c0kSBZeFpkoo/OIL1HXBaWZLeibaLSFomhUJOV+xm4qm6IJE46HrxawoEoJcFaR9vOnlJa5+4v1DzuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAFIFXK6; arc=pass smtp.client-ip=74.125.228.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAFIFXK6"
Received: by mail-ed2-f10.google.com with SMTP id 4fb4d7f45d1cf-6aaf76d8881so1203431a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Oct 2026 14:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791234918; cv=none;
        d=google.com; s=arc-20260327;
        b=oGrlKYkum0H0TFE8EPhuFrfj3ubAprAkbsUSfBpkWBCctznaZk+BFpYZ9jKKrCBGMP
         zk7t/4hLP62sLqLgUq7vGiGQX7XuIzJ83OQT2hgRRcJA/2ynANJXwBFLjJkzW5/aaBdJ
         jbBU0RlcA2m7ISrjYXZvjXQdL6C/v+UliLQuCl1t0Pyx/yURQW3IMWTXpg4V2IEBHUxe
         ZzU3JIEPexDt1cxpl2SVux4C1fphs9XQAFVnihW/2t8XCqNWClDPn1eWn5sDFiFnOg2q
         3Z+RDgGGfuy2cX9F1Yfh3Ji54zKOy0eqDq/lx8DsuZwWV8kTN691mLrHEaF9GmxOsOhX
         lz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v463Ztb7l8HkbYlND0+jy6OLKJauaplyxKRrplRmY1k=;
        fh=B2kbjygiyVpMOjn0s/HaROBMoBv7lHTzC7Y0qjHLAVA=;
        b=eg/LEdn+G0X0Jyp8UWEuVRFAWd3j8iUFjwpmvot63Uoh2TjPRN53DBSNvZ+iioFK3L
         x+LijHM46q+lMSkfPVQ8CiVNSMavL+6J5bcuB26fjn6lXlK9dl6bk07DMzS/TCyLp6cm
         HNa7fuJPd7CENAZtMzci65QAxO0/XRJoyW1bZYTTaUlJfNY+CU3PyLJZ2waP0OHNhjVw
         zFvL4OZnex2j+YrzBhvIj7UDObD1xeyRC2AMUyUJZky3K+lBQW1TqF7YN1dvFeTZICQI
         VNOUcV47fQSwJFtXZ3t1vV4Cuoh34/VtaEYoA+zSeYMB77nxfiWmTmDLUvjaTdk3pMxc
         IAfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791234918; x=1791839718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v463Ztb7l8HkbYlND0+jy6OLKJauaplyxKRrplRmY1k=;
        b=SAFIFXK6PwsIHAJFlSgsJvpLZAAAaxXXJKBVyGiqvqZBQ1qV/qA02uCQqWCcTBeSEX
         t+DfKN2/e9Ktb60blPSTUhRP3DMqSr26MBhAffDKXCO1cBKLE9KqjtP3KsFv0pTyIHxA
         flHZpo7j+AX4rpp765KRTePnoaK0oWKQq+4Z+/4tcvXmUoFWPHOVeyIeOgpmiD4KnKaT
         BDj+376D567sTBCKAKvaeBqRwnuJFfD4M+QUH+ehf/lLQ6N6RbiWhGuZWAh0IPXjUlw3
         pTnp4lofAIsfNCiGgwHnH65kdXQbWx+FYypBg2Nl4EWOhIl9WB5K4to+AWXCWn/RXY+X
         Ac/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791234918; x=1791839718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v463Ztb7l8HkbYlND0+jy6OLKJauaplyxKRrplRmY1k=;
        b=MMuML3YKXvYx3f3vVUkaK/ZKQ9wiBXrVj5WehaIhsTUSTiVYkDPBjS9McHJiotNI3f
         QsCXNWJk3yDVSsEl/cqHdLiXCNl8q+fvmrFHeOd2BMqhDa6WDcwDA6EdgB4GdIPPT1vN
         1AXl+syMIAFhNKqinuJTEwGYxWj94RSWhlgfYdC6OJv17VX5FCO84zDXIeXOh4d5nb9W
         fp+7EJPtnBGDMDySL9cIS2KfyUjZscSQXA5mkaHBnL8GD2eDECtwYZ9zd08vWp24XW/p
         fXypl3Whnw8EfEzxnM0HJBdNCuvwDKk0PeLDq28NUIYW4blTAhUI/HBkPGJcrNcsmfi2
         YDpA==
X-Forwarded-Encrypted: i=1; AKwUvBwc5Jhn4FgL0ee0QEXjfW0c6Fr7kfMNTwdMc6SU8P6Yp4pwD97MgXi+CJ+WW1YvDbxG/q+AocYUoIofKvC4sN/hdQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVOED8o521x5yRHGa61CWVv2PARcconWkPq8ZlvtDGTWUtTrFd
	FfcJc6BZVCNAd1sYe26/2wtLogTD0G8sC5kwTV0/hW3TZLFeYdnICYKAdfbdW9CxdSUXJIZravt
	KIjzk5TU3DjcWtpaEGF23e0Ohnf9Y9Z0=
X-Gm-Gg: AYBFou13sdCNOlcQr1vAK2DcBhxEc6qLHrEhvOJQFrDpRLuDqqn/am7V1raXGCArjAt
	7oWrnnbstPNDddNTcgzHHlNRfrMD3S65/j2cW13CJWQvtKQhf1Uc0cBYl5mzEcfEt6+vaVwvASi
	bNUv9DPOqNCPqwg2gr24FAks9NwPTKARSR1iNN/ZoE2ICXcmGEddlytfEDjLAszCAuvIlXtXQY0
	CLbX+AvHAeVQaTtS1j0ZDAO33rh+Wkv8Nmy8k3gfOPhrX1aMmrfQPbpSddFGEKFcklepl4G05SZ
	n3i5mxnD9Ryu0ASMo1OWrcNhUgluLm4fOsai+Rc+nSanIzbAYQPwY+hLrg==
X-Received: by 2002:a17:907:7215:b0:c2d:bd95:874a with SMTP id
 a640c23a62f3a-c2e4ad79199mr1112515766b.17.1791234918176; Mon, 05 Oct 2026
 14:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org>
In-Reply-To: <20261005135939.01ccde50@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 05:15:07 +0800
X-Gm-Features: AclHuK-hmC2IHermBe0I62cu-4Uo5MfOk7srVIbtbJ9DQ0aB5gykKJWKnA3WMzU
Message-ID: <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 04:59=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:27 +0800 Coia Prant wrote:
> > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> >
> > Add support for this selection by introducing
> > the "rockchip,sgmii-mac-sel" DT property.
> >
> > From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > bit 1 (pipe_sgmii_mac_sel) is defined as:
> >
> >     0: SGMII routed to GMAC0
> >     1: SGMII routed to GMAC1
> >
> > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> > remains at GMAC1.
> >
> > This is necessary for boards such as the Ariaboard Photonicat, which
> > uses the SGMII interface connected to GMAC0.
> >
> > Out-of-range values are rejected by dtschema, so the driver does not
> > duplicate the range check.
>
> While looking thru the patches again I noticed this is changing generic
> PHY. Maybe you can send it separately to Vinod? I don't see a hard
> dependency? The code can "converge" during the merge window for the
> whole thing to work.

Hi Jakub,

Thanks for the suggestion. I looked at this again, and I think the
dependency is a bit more involved than it might seem.

The PHY patch (03/11) adds the driver support for
"rockchip,sgmii-mac-sel", which is documented by the PHY binding (02/11).
The DTS patch (10/11) then uses this property. If I send 03/11 separately
to Vinod and keep 10/11 in net-next, dtbs_check will flag the DTS property
as undocumented until the PHY binding lands in mainline. That would break
DTS validation for the net-next series.

Also, splitting into separate series means each has to queue and get
reviewed independently, which I'm worried might not all make the merge
window in time.

So unless you strongly prefer splitting, I'd rather keep the whole series
together in net-next. If that works, would it be possible to coordinate an
Ack from Vinod for the PHY part? Or if you still think it should go
separately, I can do that too, but I wanted to flag the dependency and
timing first.

Thanks,
Coia
