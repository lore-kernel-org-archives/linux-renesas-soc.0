Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693066;
	b=CiF/eWAJ9YLYW5AhdB95Tb9ojLCUvnVVQGMMC2/gYMznJECXz+JiAupD1PysLZnPaOtP
	 KVc9k2ncCp7hfk6vpT5x/jGCs/uDA3vbdJjpGM9wNDHHIL/foWr+GGTthzRaU3zVqNea9
	 5mZtYc2Xm5FoLpbtDihNL7yOsmMm2vQ+LPxF1fi3iW8f2LmlrHce8AJoBSMrjAJQKdHYd
	 F9bR+v/Jc3FEbJvBbBe81zsYEyTq5Mo34MOVb/3jFc2yfagmhhog6edaEiY2AhbFuDq1Y
	 7/Dy79Ce0phdJwH7hh/+rZ6Q/hVYflMWJ9vL9sPNxK5SvixlE58OkQyNqGTVDZpMT6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
	b=eFYFc8ftLpIGkMh5BdrqSWOtq2CkopLcHV4B7lQESy+jZgIfbM0zybJvC3zrWJZZp/Mb
	 LT/lYn/+vXZ383JGdBRzJdgKSd8614fFjyfAK2JjvoTZuRiQkGWjRN3OUBFs6t+vOUnj9
	 Fv8GlNiilvrrNpGQKNz9uqtWcrJnpATX0JagIA6rNio+OA02+GUATOSey4Gyoce2PBITr
	 dTciWQwqMNXrJn+tiLCV3QIde18IB//k5o1qidybgPX3HsK26wBBKIUn2+I6kgkRY+imq
	 1EFn4zgbe41IVx3X0yBuJoC7+WM4DcoSk/uxcxtj4/2nQulx22gB5b5SjQjO9kl1qZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IO6/OXbX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433B7606A321
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 11:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433B7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IO6/OXbX
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3949452f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 03:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693064; cv=none;
        d=google.com; s=arc-20260327;
        b=RVVjC9qOTNwxEZoV5mBy8cSI8vJk/upUOvvTS7YuuFwshwmU81sUK9bqNJZSggp8he
         pWGDrxrjpoj7Hx2PNcEOkWpEjWhug1T0zLHuCoG7ep+Zkgair22d7TDdkEF5LfxOKinp
         7JdFH9ea1sVngiu8gYWu89+Dh2Su2GZ4F/T3iX1QKoXPkoSYiQjcjOUzzdLYr660E0vc
         35jgFVYTlcyXjOkxXvshnN83HaQKdClUwWxXw31t0OmtsfrHo7f4SCRse6J5O2Bou2WB
         tkwuHBrzTzdESRfFfIn+WwHMKP6RpRovsXLu2+2uPZBe1xfnsJ/ReRyLRtJBDm96ZJnV
         8I7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
        fh=KRphb/8DfhlKj5/kuSaDv6CnK2fJo3nGxjRqmWXpvbc=;
        b=NjmfsNRmiTFcy7SWgR5Ek5k1BCbMRoPe/DTxr2/JpBuzaHUEee8YbsJABH+PBcwGzB
         Gj/w3l89/JVzYc/D8ljLwnOEDTk82Ak1t0LQI95yFBWXPnsXH3i8U/WTl11+f1IF/spi
         ujKlc0bnC6jRr3+ln1o8Cwe1HxjkdYhf2pspOWTlZj1a77NKa38RkqYgpjSeU31Pxtze
         pI8L7sghDQiPEv7yDnPFjn/IjdxQh5TGhuYC1b26tk1bHAgQTCncmtPVtLl/QUGp7A7E
         pj7fuRRI6QeK8aNxyb1254DgIOsRYFZz4h47sXKEXCeAP4WVN7imzEHVukMTttuACVV4
         gq9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693064; x=1796297864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
        b=IO6/OXbXushm5cEYgJH1WrUaxQGQf9E+eOlWsKatm/CsFtoMMLVjrNJBbc0Wb9fRM6
         lauQuigiVAT+QzVhV735jJMLSa/dZP+BoYoW25OcXJJ0Q1Atl7t8yhU/rhgOkJt3FXqu
         U3S4fMduckiIbcBbEdmr8bCdSjSXN4Ox95L2XIeFSyzMr+q3UDoTxbSg7GcWGwa+hXp3
         mCZU1ZOEaxtZtnPrXLmQTHqvEzhRyU/wj0h/rjesHXBvrQCYBRpyNS7hBEGyndqb6w6Q
         4xHvh2DaLIcbDjiits2BI35X42WevzpgEQy18F/jCvJX8KFXhbGJTEod5/6hP6q9KJba
         FgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693064; x=1796297864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
        b=wrX0nTW+++ti1mqMIF3jac77xIzlDiWfxq0KJs+IRwwJpN21W9Jmy7IKFOZZgdIQvp
         ff+Vefl9jBU7xIJUwlup8olILAkxGheP/jo1+R2uQsMe2PECFZTSh1eFwuBSjfnjJOru
         XIhe+jdo5XWSIUTwy+YrtZNNOnPYOUsSdvbKdix6l3fjQOf3xeHVcFhIP4bh+CpinLKZ
         CmcFLE06KW3hEICxFBRZCj0jOm3POPWcFJzp+RfJ4TvpLz7bzLRYHvMNxvwfnkWBvEMy
         qBhfw9YKhSZ38Bwwxgl/YNR3WGedsTVQusqacbX3kJY9m0CLzJtQ4m5y2QOcSIvVZjCc
         qadA==
X-Forwarded-Encrypted: i=1; AL+hErFeISToguz++0MSQLmQcHmctKMQZDr/woo5OeLTcos5y+bKPhbjFp7Xbb8Ai17jV0ro0XfcB3JYcXweaDWAtygK2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/12tKP48o5Xu3r00HL6pBCnHylAF1GFDqzN5UrlBgCSrGJo8IN
	v0XMxGhn/4NynOu3G+Iu0Y2yoU3cc+sG+LAgs81Zmnu0Uiq2ISGzNdrxXiO4cvuzXmpQ+UPq+X/
	z94CVRaz/JV9TJfC5gfkDAJIuA2CErV4=
X-Gm-Gg: AZFdTZcdDj9jILiy7f781upEALWY2As36vm4bK/RQq5wnv9HPjY7+CuO6yD8xypjvj1
	uMb1Tfq9X+056u+NriLJitPHIwxgM0KsH9LGSrvGF/Q/useCWoMtkrjuCDyGu+psZmEz3/XlLHy
	6TlnJ0VZYvtLy1A/O/AhFQmIUrdB5GHDGJME4R6ekPhYEQsqH6KLNTx158lK9MZmQxBZWlhk9bE
	xLO+cjtOVRahHbqs9/EjizcotO3ymz3Vs10kd+60cLJE65Xk0R933d/p/Uj/5TQudD/0lR2zeUV
	DF9cGPtvESOnNZu0BQTQo9CT55hcZYUaSqlhyWPfdpe7zyXkOyFoeFkk7MzsNI97kqagYySGbec
	sslAjLBXDPNKPS3oENriZN8z6pbZlNyHWxTiVETrEb1rUEhvDje6QcbfBBgin352CcBtK1IhUu1
	Va5l/HQkNKtocWaMdsBJXeEtoqIMy2LcKbvXwm0srdk+65P150iHdjo9nKjw==
X-Received: by 2002:a05:6000:4304:b0:4b7:6d41:f12d with SMTP id
 ffacd0b85a97d-4b76d608a13mr15756287f8f.27.1795693063407; Thu, 26 Nov 2026
 03:37:43 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124132802.2003605-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179561342293.3135.3941627441868252725@kernel.org>
In-Reply-To: <179561342293.3135.3941627441868252725@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Nov 2026 11:37:16 +0000
X-Gm-Features: Aa3M54qKq7za6CWkwIvxk1EuXc32uI-wo6A6tNrIs2BtzXEyjHAyjQeGf7f6308
Message-ID: <CA+V-a8vxYR56e1dxG-2ReYdLcsY4DsSS+GB7RqtbP+U+cEaV=g@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: Advertise TX checksum offload only
 when supported
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vinschen@redhat.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	prabhakar.csengg+renesas@gmail.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:30=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The fix does not cover the bugged_jumbo case, so DSA user
>   ports can still advertise TX checksum offload that the stmmac conduit=
=E2=80=A6
>
> --
>
> I found one possible regression: on bugged_jumbo cores, DSA user ports ca=
n still show TX checksum offload after the conduit has turned it off. The d=
raft reply for the list follows.
>
> net: stmmac: Advertise TX checksum offload only when supported
>
> This patch changes __stmmac_dvr_probe() to add NETIF_F_IP_CSUM and
> NETIF_F_IPV6_CSUM to hw_features only when priv->plat->tx_coe is set.
> The aim is to keep TX checksum flags that stmmac_fix_features() later
> clears out of vlan_features. DSA user ports inherit vlan_features.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index a685ce4638f61..d32d3e7b1b8c6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8147,8 +8147,9 @@ static int __stmmac_dvr_probe(struct device *devi=
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
> Does this cover every case where the conduit drops TX checksum offload?
> stmmac_fix_features() has a second reason to clear these flags, and it
> depends on the MTU:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_fix_features() {
>     ...
>         if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
>                 features &=3D ~NETIF_F_CSUM_MASK;
>     ...
> }
>
> In stmmac_probe_config_dt(), the snps,dwmac-3.40a compatible sets both
> tx_coe and bugged_jumbo. The snps,dwmac-3.610 and snps,dwmac-3.710
> compatibles set bugged_jumbo, and tx_coe comes from dma_cap.
>
> On those cores the new tx_coe check still passes. The checksum flags are
> then copied into vlan_features once, during probe, while the MTU is still
> 1500:
>
>         ndev->vlan_features |=3D ndev->features;
>
> When such a stmmac is a DSA conduit, the DSA setup raises its MTU:
>
> dsa_conduit_setup()
>   dev_set_mtu(dev, ETH_DATA_LEN + tag overhead)
>     stmmac_change_mtu()
>       netdev_update_features()
>         stmmac_fix_features()    /* clears NETIF_F_CSUM_MASK */
>
> This clears the checksum bits from conduit->features only. vlan_features
> is not updated afterwards.
>
> The user ports take their features from conduit->vlan_features in
> dsa_user_setup_tagger() and dsa_user_create():
>
>         user->features =3D conduit->vlan_features | NETIF_F_HW_TC;
>         ...
>         user_dev->vlan_features =3D conduit->vlan_features;
>
> Nothing in net/dsa appears to react to NETDEV_FEAT_CHANGE on the conduit.
>
> So could the user ports still advertise IP_CSUM and IPV6_CSUM while the
> conduit has them turned off? That looks like the same symptom the commit
> message says this patch removes:
>
Yes, this can still happen when bugged_jumbo clears the checksum
features after an MTU change. DSA user ports copy
conduit->vlan_features when they are created and don't update them
when the conduit's features change.

This patch only fixes the case where tx_coe is disabled. There, the
conduit never has TX checksum offload, but vlan_features still
advertised IP_CSUM and IPV6_CSUM from probe time. I'll reword the
commit message so it doesn't suggest the patch covers the bugged_jumbo
case.

A proper fix for bugged_jumbo would have DSA sync user port features
when the conduit's features change. That's a DSA change rather than an
stmmac one, and I don't have the affected hardware to test it.

Cheers,
Prabhakar

>   "DSA user ports inherit vlan_features and can therefore advertise TX
>   checksum offload even though the conduit cannot perform it."
>
> Packets should still be correct, because validate_xmit_skb() on the
> conduit falls back to software checksumming. The problem is limited to
> which features are reported.
>
> Would it make sense to also clear in vlan_features whatever
> stmmac_fix_features() clears, or to handle this on the DSA side, so that
> bugged_jumbo conduits are covered as well?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261124132802.2003605-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
