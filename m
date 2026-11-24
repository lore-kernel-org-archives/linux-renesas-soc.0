Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526515;
	b=RDEFWgu/naVwZ5Dm5xnkn4munN/5zVNAVQj98QPfQGq9s2mDt6qNmRDbSI7h9XEw75EW
	 G92ez6pbsfL5xAkjGDvIu6Z1bgT6Fhn6KFVHtCT9iV9slPDMpq7GF9r5BkY+R0fdV3ulD
	 kf0Rv0o3+S5bimIwr3smMMunX60qaZms5A+T/uAK6sXI+zzHFiRd4v29yHQVeJ/+G9dr3
	 biQ+L8kRCmW5bJmbyVGJl3Ptwr+IKSUdpWm9JJcalYGpVpOy89AoJy6p/qxha2wSPWTot
	 JLWqKG9eEPMvXmiuxQj050TdiAKk6Fz52BYFetVfQgQZpi+WIg1S2gp1iivR+8oap+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
	b=cdGecIjYX2/TtIArjjTZMuXqw4E9ZZjhiHsDOFFusY0hWcgabqFXb0dX+dfZRDhz4p64
	 ZvQFEHYIdcmy38HM04ReE0f1lcb7xJUBvquvgTYf4q9gAQzjW64PPgFNAn2sW8gu6XdYL
	 XzEU4Gp8eiQkfqoCSYXfO16Aff5EzIT1hNMs0+lFzh6/+0GmxlGHm7ArqUYJpFO90o7Km
	 A7OIYbvbSxDykGNkXTKpD5xAcS/KCFEF9/75UlkujpPwze0kPFkm74YoPb+jccEb2D/zP
	 G+HQF+cGWRFUFYVlcVCI4GoGRwAN310p19VHStEazO4+VxvyrKLdEDA/katPvx8f5gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEv3O6VV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6DB606A31E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 13:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F6DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEv3O6VV
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso2595976f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 05:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795526512; cv=none;
        d=google.com; s=arc-20260327;
        b=BW1esqB1YWB8ALi06O17hyaQvD+4swEzxZLg4NUads+6RwsU1+5LJsSd86JYCvbegN
         DHcXx8pLWApXwHmraZvPlFFuJ+0f1qFORP1SrFpjdHh4+FFv/KO135AsE8ajcMU9BaYj
         8cWoxRcQXw2y3TKWAeXk3x7zMP/MYsh8s4XbhKxGPR7wxmrjqyGQVqtLrc8EHKsiHzTh
         8YpUroNRZYxaCZ4iJkQVQlYJE88t4+ViBNnF9MZb2H/yN5Ytv7553AVHkNDMhSkMFcIn
         qKCNZP4ZhL18NRzRVnvSWtPjjYd72iPfEVBd17LPXvePpHonC/ray7iKxwGCFQF5nCaG
         Ndgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
        fh=/Cs7kMxWekFs8JdSuYzOyK/Jtfy8Hm2lW5cSKT4aYjY=;
        b=jB7DpvhCpNjvzxHiCwfOWAiE0kTNJSEY+Bdk4lwm08L/Xu8iZ1htbLqasUpfAvJ9Kj
         VxVPu1WaqkSqlDqPZDkEd1AbcrYCXT5iEClmeP1I996K8Y7QuRN4WUkRgGoEEy6ZOlCs
         ihv5BvM2hvgpeHUU8uj8ZHUISaAY6Y3upknha9I+DFX3GtHd4LAfp6IrBetDP4M14zga
         QXkID12S+NLKDbvWkkStia97362H1VC3HTaS8BuKuyaN9s5Y/ZlWguSZgGmRbznrBdBt
         9oaEQIkK0RVYzbFBGd/+JLrOeL3SMat/FJLSEKIdcsODTQcsuTjcUH7bORcKYEqtTFew
         SHPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526512; x=1796131312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
        b=WEv3O6VV7oAYfqb5Q3iVQEXrGnA8FwXHCw0b6VuIUa0b416bAe7OdpQroVS0h2sqaS
         4K0jtt5QtjsvOv3T446w22vPNRBpurgqzoyW1F/onU6UDhaYXey9n4igKtSR4/gLrjt2
         pXaLcFojoz+i7mBMPtQMMLfzNJFYQ8e7YTajLUCkBOrt7sRmLckAVPgSWKg+FEXBP5CP
         YNSdcE0kQXMSD+ixnDBklSEVoERKiaICnkebWLhPonu6rkY0XZAlT85LoVwsvzpJM1Ug
         jKFHxX9hsU0X5JpZhifBuCtDmCJm19amZuV0Zb5wTn301GWRWkjN07wHOJrQT/wGUij3
         JplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526512; x=1796131312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
        b=V/qt6nNd/8X7o4N8KHHv0EVa459KUp9zk1dta6Qa052YLsaWvnAGXvcgXMbh26m2tL
         BFDmzVmuAO7pkAUOxEzPK0Vd5eNq+zIY/5VzSCin/Noe8E+K+F3N32MYUPIA2ZFyFcVr
         WmMYP3gs0hjR2I2JibCRxtnkyFwzHlD8M9JhBXZz6OIgH5EEdTU92m4C8/bjdrCfK+ha
         SYduWRL0DvRiLZe4tWRQne6HnaqacNMzRZgfh8wr9a+0T4cJETz4Sa0y3iwus64p8AUr
         EQuEzXZW50UZCr9K4zebz0qnOORlY4eup1H9SA+nNPN19YE534H9y8OYCAxGc32m5FQB
         gz6A==
X-Forwarded-Encrypted: i=1; AL+hErEJYlCSo/ZZGH2nWxUUYM+ZXc1gYRsoGbKkBw3LJi9vYJHx+PLKrQVApd043hmx9FtC5SymCmrvBAm1AFjRrlSvCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+zCcus4v8nf9zmC+4MzEn5/cD7tdtWVqitAF7xdl6gGZeoC4SL
	JNCRYlOwBONyWFPS/jy4qFowDs+ZGlF/5RLhtUhXP4BwVvYQQbObPosefrWzjBePXZQJ2FXDJH+
	qFlD3TwjStIplZX6XktjLqPXRzeEO4iA=
X-Gm-Gg: AZFdTZccUXY2VZL0vF6iCnvrC46PDOLi8NIE15GCUuM75YAV4wNa1qwlxXz9XIHdfHh
	ibYMVthw8ZFV+ktFavYHO23eKSyZ0YXpgdd7HphHrcWXzhB8gPf9u4I1ey3zP1lYWBZsd7uYxrl
	mb7ZP/siDMGSjAme0J5gI5LhK7XDQI7PFMaNq8yzqszqhrj71+slhow9EfxMu1onOofiOBFhmxd
	kHsaLIOlufjv6bHXWeA5xaHTJgZm/8pMxIGkRALaZGoYKqsPKGHjm966O6e/b7b8riFaBGi76hn
	p8JgbdgOY29IrOedl8TY95aEy1dsua5JL2FQBniLsuTEAX/0M083yR/HRu9OZe0QkHHpyxQJIja
	3iKx2VCMeF8KRV/tASHEjaWAOB0IJsC7maX51lXdYcFms66WCr1RvTzJ7A621q3wua7OoFNyFvV
	UT5sS0DeNpbN9a64LCXcjb2d8sXF3q+Xv8fBRv2NaW/SuNkb6VS6XZW8Uz1a0//KOO1dgbuHl1Q
	lt18Ac=
X-Received: by 2002:a05:6000:41c9:b0:48d:fdd0:6ce8 with SMTP id
 ffacd0b85a97d-4abaab633bcmr28636444f8f.3.1795526512489; Tue, 24 Nov 2026
 05:21:52 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179546436704.3135.12593345717335656860@kernel.org>
In-Reply-To: <179546436704.3135.12593345717335656860@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Nov 2026 13:21:26 +0000
X-Gm-Features: Aa3M54qYvwnStTQeBsV6jkU4pnj89Z8PUCLhVvQ2lAGOs1SaKPKt9ljNLbIFBQo
Message-ID: <CA+V-a8s722YOUnoErKDEiMd2KsZT5E5wkTvjJ1Zbeji1UPiSRg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: Advertise TX checksum offload only
 when supported
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	prabhakar.csengg+renesas@gmail.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:06=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new advertisement gate in __stmmac_dvr_probe() trusts
>   plat->tx_coe.
> - [Low] The commit message presents this as a bug fix ('This can cause
>   DSA user ports to inherit checksum offload through vlan_features=E2=80=
=A6
>
> --
>
> net: stmmac: Advertise TX checksum offload only when supported
>
> With this patch, __stmmac_dvr_probe() adds NETIF_F_IP_CSUM and
> NETIF_F_IPV6_CSUM to hw_features only when plat->tx_coe is set.
> Previously they were always advertised. The goal is to stop DSA user
> ports from inheriting TX checksum offload through vlan_features when the
> conduit can't do it, for example in threshold DMA mode.
>
> > The driver unconditionally advertises TX checksum offload, even when
> > the hardware capability check disables it, such as when threshold DMA
> > mode is selected. This can cause DSA user ports to inherit checksum
> > offload through vlan_features despite the conduit not supporting it.
>
> [Severity: Low]
> This reads as a bug fix, but there's no Fixes: tag, and the message
> doesn't say what actually breaks. Is this meant for net or net-next?
>
> Before this patch the conduit's own dev->features was already correct.
> stmmac_fix_features() removes the TX checksum bits:
>
> stmmac_fix_features() {
>     ...
>         if (!priv->plat->tx_coe)
>                 features &=3D ~NETIF_F_CSUM_MASK;
>     ...
> }
>
> So only hw_features and vlan_features were wrong.
>
> For header-tagged DSA traffic, validate_xmit_skb()->skb_csum_hwoffload_he=
lp()
> on the conduit already falls back to software checksums. Also,
> stmmac_features_check() drops CSUM for non-IP ethertypes. In that case
> the only effect looks like wrong feature reporting.
>
> Wrong L4 checksums on the wire would come from trailer taggers that rely
> on the conduit (tag_trailer, tag_xrs700x). Is that the case this patch
> fixes, and could the message say so?
>
> There is also a change users can see in ethtool when tx_coe is false.
> tx-checksumming on the stmmac netdev now shows "off [fixed]" instead of
> "off [requested on]". Should the message mention that as well?
>
I'll update the commit message with a fixes tag and send a v2 for net.

Cheers,
Prabhakar

> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index f256244ce0d11..8cb1e3b4030e2 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8224,8 +8224,9 @@ static int __stmmac_dvr_probe(struct device *devi=
ce,
> >       ndev->xdp_metadata_ops =3D &stmmac_xdp_metadata_ops;
> >       ndev->xsk_tx_metadata_ops =3D &stmmac_xsk_tx_metadata_ops;
> >
> > -     ndev->hw_features =3D NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6=
_CSUM |
> > -                         NETIF_F_RXCSUM;
> > +     ndev->hw_features =3D NETIF_F_SG | NETIF_F_RXCSUM;
> > +     if (priv->plat->tx_coe)
> > +             ndev->hw_features |=3D NETIF_F_IP_CSUM | NETIF_F_IPV6_CSU=
M;
>
> [Severity: Medium]
> On cores without the DMA HW feature register, does plat->tx_coe reflect
> threshold DMA mode by the time this check runs?
>
> The threshold-mode override is applied only inside the hw_cap_support
> branch of stmmac_hw_init():
>
> stmmac_hw_init() {
>     ...
>         if (priv->hw_cap_support) {
>                 ...
>                 /* TXCOE doesn't work in thresh DMA mode */
>                 if (priv->plat->force_thresh_dma_mode)
>                         priv->plat->tx_coe =3D false;
>                 else
>                         priv->plat->tx_coe =3D priv->dma_cap.tx_coe;
>                 ...
>         } else {
>                 dev_info(priv->device, "No HW DMA feature register suppor=
ted\n");
>         }
>     ...
> }
>
> Older GMACs such as 3.40a don't have this register. There,
> dwmac1000_get_hw_feature() reads 0 and returns -EOPNOTSUPP, so the else
> branch runs and tx_coe keeps the value the platform set.
>
> For "snps,dwmac-3.40a", stmmac_probe_config_dt() sets that value
> statically:
>
>         if (of_device_is_compatible(np, "snps,dwmac-3.40a")) {
>                 ...
>                 plat->tx_coe =3D true;
>
> It reads "snps,force_thresh_dma_mode" for any compatible. Nothing makes
> the two settings agree.
>
> If both are set, stmmac_dma_operation_mode() checks force_thresh_dma_mode
> first:
>
>         if (priv->plat->force_thresh_dma_mode) {
>                 rxmode =3D tc;
>         } else if (priv->plat->force_sf_dma_mode || priv->plat->tx_coe) {
>
> The TX channels are then programmed in threshold mode with tx_threshold[]=
,
> while tx_coe stays true.
>
> In that setup the new check still adds NETIF_F_IP_CSUM and
> NETIF_F_IPV6_CSUM to hw_features, features and vlan_features. That is the
> DSA case the commit message describes. stmmac_fix_features() keeps the
> bits because it also checks only tx_coe. stmmac_xmit() then requests HW
> checksum insertion for CHECKSUM_PARTIAL skbs.
>
> The driver comment says TX COE doesn't work in threshold mode. If the
> hardware really skips it, won't those frames go out with only the
> pseudo-header partial checksum?
>
> No in-tree DT seems to combine dwmac-3.40a with
> snps,force_thresh_dma_mode (spear3xx.dtsi uses 3.40a without it). This
> may not be reachable with current in-tree users.
>
> Would it fix this to move the force_thresh_dma_mode check that clears
> tx_coe out of the hw_cap_support branch?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261119185016.1789843-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
