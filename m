Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199780;
	b=v58Ffdvrqc9UKTt9r+qOM4RbHXr2A73JEv/Ss2u0DNvcCqqJ91b/4YMymAM0ILoXSHhA
	 Ul4QpUfSuWwzxiP5CL9+hE/HRE5lc2WfYtx3CxOL1AYBVXoRzhTPA6F6/8svk9A5vabaA
	 WvgZ9u9Z+KpCPUTTPFpzOum/wK24Uvd4LXAePEEJTFuxZDsQ8CrTwiCunZ5saviXsir1l
	 0q/kl5hNYnAe0utTgxbjkrOyB8dj3Bwy6pQEE/78hr/UjqnsHSb25+BbwwqRkE/KHhUTu
	 M2xw9whDHxL9XG1qNjkGzitVrJA/yJFLjTS7wZtoD72MkXhHe9NPHbOM/g9U8Qe4N1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
	b=0MU/0bG/nGHovblNbH1A+zTLGvPQG0J68a+s4bRmy2vVXhNnc8leGzK1Su+5tX+YqMcR
	 HA2rxjZZhgza57Oj2h+6bA1+vLiIIPRVzktkU8jVvFZQMgri1YUZnixy6JaNSgtHY7QDb
	 EBvapGG7uubbluKTM9IjbFU9kKgbBL8/5+Wu0YG1Mh7LUf7+giCR/5+kmTkPDIsHZWDHa
	 6BZbwJDl9Fau5RO3aU87r8q2VfIJeJ4PWMm6Jk49p/VztlWlJK9i7MdNi5KNy2HVnKfvQ
	 OU9BSrC6sMZcDr5HTtSYSQnJ6leQLgxnvMpzwihgv3CDIjtxVAcPTooUmW3V0vrpSfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhhhzOot;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEEC60A261F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 18:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CEEC60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhhhzOot
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1015220f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 10:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199770; cv=none;
        d=google.com; s=arc-20260327;
        b=oE0NP7DWLboMUmLl9QEShonq673cFRSHWAvrW3S4yvOkhSAyogNe0dnjF+L6z61Uyy
         Qyk1HFPKQ/YlBt4kFWLJkrN5IEMnDH8gASXOwa5cNBhKUN+xmL3mOpxhbRISgHnbMjEk
         FbZqFnShD0ft8ZDMrPNk3i5SB2BzonON/w8Bx5Lc+0cAIsyY2SwNTOjRzY6DVC3VUh92
         fVxtr+l/4axbmG20fJT58MSiuqG4EueoELuyjjdyBGlxZD7WCq42L3UZRvyrsT74l4/W
         RmMJzWjpiN7aGg+qNlBxKVUXgKME7x1+QSHzbvFRjpoK8Pur3CzF/0R5BQkGSK5G+OAg
         U5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
        fh=ArkiJT6AAn5KQtsXj3dGUnKDa5y4kDJXzl2pE6BaBPM=;
        b=E1MAWuzgTGf20sd8RuRqFY/EVCSexPbpZinXYs+haVDtzrxIWIRzzl/za+u/bL1Q8P
         B96tgNnv8x9qKY/agtDouJ6xeZWMxs9xMg5FRCVqtPoCeyBb//ran56KkDfBVP2zb0v4
         LV0as8yLBONTtEKJt7WRB/XJfz9dVF9hWPsz9J1HeoFrR/K0z/ZKN+g+CD4mj3OgZ2PZ
         2TemkcEZVqohCa72P2qluVSwPuTlwqtX/XkVjTiGCzGodVZcsttGA5th3Gb1NctNAsoZ
         6+7ake3p1tggGIyd4qd3uKc6B2Bl1TxL3pU+lm9QyD47Pv60gyuTnhXj+DcsCVB8RlaQ
         SyXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199770; x=1795804570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
        b=MhhhzOoth3xNp4mBIoSCsfaBcfe+qgDacYLeCNiiaUZDcBhpuY9rHSYdJJvxx3Deye
         9BqY4Jg6+yYsHV6zDxnH+ZHlvLhA3gk2U08rTantGlRaFBmKkuT2rIIX+VNYElga38+l
         fXiQzDDFr4PHLElbGi0nDzKpVpO8L0a6rj867hXOgvYbu666cMi0VYos/MyGfS/i2OR8
         A24vOwKFMARIz8B26GN1gzWHA3YbBoxwrctmSlRxdVz9yrSRBaeeeHeAZyNyd8NNFbjb
         spd0hHtocJ8Q/c93ePqPgfBzb692s/nVxXNbtjUOcC/bKJEhw725KMtZUN7xjOJCdbld
         r33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199770; x=1795804570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
        b=Ahe0s/EMmzh/3ny5wCkNLaxMcguaYxrUlssw/lx3tzzYH2fKAtiNXtk7PTjR1v27P8
         uTAPA8MoFeUzeHbf5IsU+K7X5Dnr2WrVUKI/l+45Ofu0TP0y/N2QFlEn+g9SGuPXqwyO
         jh1WCYAHv1qOA/TNoKyB+c6EbtzhYMhrPS+MfqWBHz8dbILC7ZYWfEQv0qPCI84ZJ7O6
         wkAg31yQoarUfReJtICMGtmOiNrjskQeM9DNKh6hHf0qpIyAvnK5yZQHZazPwKslunci
         etj9h1cBGOW389PgRwgegglnWcAjO5jNaFAujt32aPo2or4HDPdlkJ+oWR5of0NUo6Cx
         4QQQ==
X-Forwarded-Encrypted: i=1; AL+hErE3Im09ziXOeVmZti4d52suBXR6y3wkmcfY2TNk7u83VbkVKQSDNyiI42m7ThIvKx/86o3BqP7AkN2R8FzILqecyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8l0wUiEg7JWWxCWOdW8Q7ALDTaGC5LCg/7GHrmBXN/lMS454R
	dNpBoV1gqf3F+CeR4jaC+vG0uPlhPMkP64TnGWBU7bCsKXID4/ORCQ7t/GGf422PAX1FAbGm6a4
	8KPw4IU9ZKr4SHrsxyH6HapEvb0pjsuY=
X-Gm-Gg: AZFdTZfjr5VlWSnSwTpb7jmQ+fgsz4rN6EmnQo69/OwJijOOhQlSknrbhLjfqJFR9Ek
	NpoirBF/0HMPnQMK7m2nNPAaUy3YDo4SMzmWEXAArApI5x7D/LC1iCd6Xn/+Do2ClIZXG9d+Pzn
	VU6pASJHeK/EdPMr7oBDvi+tazyg8KvSvw/pb1c5f9WtR2IylBVdBhzmtnn1Aaiii2x0CN6yp8j
	1NnyN9csFppH+HWUS0z2W43AQ8HLPOcX/+weoJfu6Jz29D25lSxP1i9Wjn/JUneT118xyrd+pSi
	FlcuWoT3crZFve7tcg9RJ4dOXr0bmoSPPcwr15n4cCu8NV7gsHCLzWryQKncqt5lSyvgFFT2kUz
	36EfkmJDfMpl6MOp1nDtdY4DCacJmsTTZLkgzahO1VMUBkPd7cibqLourOthw/P4i1uWMWr75f7
	D0aBbB4dPcyJE6dYvB7tGVVm/2qheg0oLRCGANNFqfBth4MfBzZ9/IU1lesw==
X-Received: by 2002:a05:6000:2c05:b0:498:b92a:30b with SMTP id
 ffacd0b85a97d-4abb0c5d560mr8148264f8f.15.1795199770371; Fri, 20 Nov 2026
 10:36:10 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-22-prabhakar.mahadev-lad.rj@bp.renesas.com> <73e4df46-89ba-4578-bb07-acad3d319d88@linux.dev>
In-Reply-To: <73e4df46-89ba-4578-bb07-acad3d319d88@linux.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:35:44 +0000
X-Gm-Features: Aa3M54pteYuqCICsT2iLZaDSuKLW6c0ATYrH9gkWFijmAmsICBAQi61cGR-Fw3Y
Message-ID: <CA+V-a8s20m-vQ-Xe7gJvwyGvc-A0zRw3XpNqYAe8TtAuOcUjiA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 21/24] net: dsa: rzn1-a5psw: Update CPU port
 comment for RZ/T2H
To: Clement Leger <clement.leger@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Clement,

Thank you for the review.

On Fri, Nov 20, 2026 at 9:45=E2=80=AFAM Clement Leger <clement.leger@linux.=
dev> wrote:
>
>
>
> On 11/20/26 01:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The comment in a5psw_phylink_get_caps() states that GMAC2 is connected
> > to the switch management port. This is only true on RZ/N1. On RZ/T2H
> > and RZ/N2H, the conduit is GMAC0. Update the comment accordingly.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5:
> > - New patch
> > ---
> >   drivers/net/dsa/rzn1_a5psw.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.=
c
> > index c0c1f45852da..751d03b0bde4 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.c
> > +++ b/drivers/net/dsa/rzn1_a5psw.c
> > @@ -237,8 +237,9 @@ static void a5psw_phylink_get_caps(struct dsa_switc=
h *ds, int port,
> >       config->mac_capabilities =3D MAC_1000FD;
> >
> >       if (dsa_is_cpu_port(ds, port)) {
> > -             /* GMII is used internally and GMAC2 is connected to the =
switch
> > -              * using 1000Mbps Full-Duplex mode only (cf ethernet manu=
al)
> > +             /* GMII is used internally and the conduit GMAC (GMAC2 on=
 RZ/N1,
> > +              * GMAC0 on RZ/T2H and RZ/N2H) is connected to the switch=
 using
> > +              * 1000Mbps Full-Duplex mode only (cf ethernet manual)
> >                */
>
> Hi Prabhakar
>
> I don't see the point of this commit, fold it into the one that adds
> RZ/N2 support.
>
Ok, I will squash this in patch#23 in next version.

Cheers,
Prabhakar

> >               __set_bit(PHY_INTERFACE_MODE_GMII, intf);
> >       } else {
>
