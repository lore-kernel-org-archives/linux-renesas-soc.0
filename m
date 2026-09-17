Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28703DBD65
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633853; cv=pass; b=iHWWTNF9i6380J+E7iAQgmFMlNPTJhU60RPi8JtsHfFAxdfC6cLM5Yw5wx77pNn0ExyCf6LRrmAent/5dmN1IiKeHD1SUZjY+0HtmrcAFTt6CE5HjdrAAgxp1o5kRZPbpR0o68c/M5e+zYeIZ32msThhO9RyV+mb1GW/pDfnwyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633853; c=relaxed/simple;
	bh=G5FOvTerYV+i+bh5EByuYps3MCibaVHg+MJbwyAppPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9QFBwE9CZpVwKcpluy0EPXNbgMBTuSMm5kMX91Zd6fLHR45/2oPPPeIESmR60PGQ1SfGW6NHhabrbxj6n2o/UbNinvjLa+v24HxwNTT1Ge5kDaLs456v9WOcbfhGsWRmOUqPf8GfZr0zsZBLXCgrVY0vwIhqZFAugQDVX5Dhqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmQ2MvM5; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmQ2MvM5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so451742f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 01:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789633834; cv=none;
        d=google.com; s=arc-20260327;
        b=F6u9pI9qyzc2EvJpy1xSrEadSWvIs9jiCSVcTv9KWC9JVNRzSCPFWUi99JuYd89J14
         9ebUvlP3szLwRkcO61WygbFaAX6g+f8UD63rJDkat0miszLAiEifMZ4dKsL+f5HqRfrA
         x+TGr5GiRKMGrAU89f6tIlyvTfnkwyy8lqHn0paykYl7Tkl3vCND5d0APOPoz6BQcsA1
         +QF46yCiCwiPw9lBSxTN9N7aEJyW8nDhvkebBW3MD1JikojmexlZcB/PAJJXFOjh6PtB
         QpWawomjQl89JsiWO/eS7AEI7JOBptHCm+FvYBqsF0FOB+TAFSZYUeC5wujMxjcBnmiG
         Fs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dKETHQ/f5XJ/hL1DtWxBym7ccO70VFb5IjdqZcf6Fq4=;
        fh=AHq9ZYxauI8Ky+QX71GICrAWXJIxRGwwP2PeeDE3tyI=;
        b=jWKwiDRD1J3LNyO7iOKVML0uli3smlIcTaGKaerDE/n5ONYTKpLDtp4ElgdShFNk2T
         BsK5BqLFC/xawFNY28Tt8qY4lnx/KWgy7G3urUU8uBS0l1xww7lFvSlSSrFGyMj1v/YK
         Ebfpp2JYk9d+RwnrEylGANnA+jZX7R0ScfEtDJj4zRbpaYHvLrZ8ObV8ZzpIsJ1DGpJK
         x/ESQsBAH9zLKvmwfSjaVNbNeEwPx7Z/OgW2xhTLEkwBaoT46QiexJZh+vwPiD/U0APC
         jStCwFCEFej0YKFEzksz9JdVDyQGuLgYF1wuwUa7QO5Rl5OPryj/Q+wxU8dj3xF2jGvk
         VayQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633834; x=1790238634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dKETHQ/f5XJ/hL1DtWxBym7ccO70VFb5IjdqZcf6Fq4=;
        b=KmQ2MvM5bbBAGigzXw/dD/EiH0Mu1NCZwNaW7R5G+nrN12e7KBsJrSgBJe8spSu1tI
         Y9hzg9wvPbydmuNFYtUj121MIqBdaATOR8dv2TtbN/GUZZxi/2I/QRDVRozd2uCjGkeY
         0AW2/4USIlZfsNIqRJm1SZJyvSjt5ah4t9SpGMAyK6R8/l/CGPOTbtOFQOWX8IO4avu/
         yGc6wzbmGiGtb/4UR1o0LZuxe46XSjXfy8OyHYmInzP7tFQ55ZewTmYQ/WXd2XPbSYZp
         vyYWXmZTJaQOwl99jriSF1w0blnppsCja5ccDmzJ1xKdMgOCXeR4x7Hidd0Ci9X4Hca8
         bIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633834; x=1790238634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKETHQ/f5XJ/hL1DtWxBym7ccO70VFb5IjdqZcf6Fq4=;
        b=wNga37okFgfLVTD2+F7pJc/vRGNZvS5pDAdF0NiMfOys+guQIgNCcz8NSrp5NLKAKG
         A+q1iEva3P0muRi0H4qyTumZPmM6itWtaSWzMuPNNQ3XLJ47Aq30EJfTTVZiov1csdzV
         impbSlsFY9hzQsrUpqXU4oDRS/W98bVva7VGCCcNaXhZ62VxFzdMWfy9qV1HwhV8zQae
         xVMtn/lALRNsIIyN3NCyKTXqbV7PWtOZx8M9vnoSC7+Jxfydsbxg3ZrHfm5iXBV2k/Cq
         Ob+EqC4zcifs77TM1oDIbCbDLA5PaLLD4eLhYIMlVnb5l3cBgTMhebYYEXLouwbJgli7
         6R7A==
X-Forwarded-Encrypted: i=1; AKwUvBwLQOVhdUikst/784wIpXMH+jVU2MqofXFcXmqp+vdkzRpbp2LVmhLx/2AuO7SOEHoB+BPRt+8WBiPpeH2o/zRWPA==@vger.kernel.org
X-Gm-Message-State: AFuF++k92doyNyW6Y1zeKrKhja2NlCu3sm5EuAZVLcAQ3KbA/S4LbPDp
	OyuM0xea1GxfOrQfmTeNqXRvT9inTvahu6KOsa5fb+TazTDAwD5c/e+8jdz7bnbQX+NYytc1omH
	KzIEX8IMBZbvqKLkG+S3TxL19JWgnHKk=
X-Gm-Gg: AYBFou1eMqEGlTyRQZ7iH7plcGT/vuZ2oGAw/+C4lQbEadnj78wXGm5Q4R/p7KGCNlQ
	E2MD0ArYWfresEMMgs9K1n2oXciPakADcOVsf4qkIbkVs76dSkCBrHSqqgSZwFQE+mctd4oEoTm
	pjcO3tYAYAGSBuowth61il4l3F1YwQ08eXnt3f64Br427J7bFORuAhMp28pP8GTVXpoWcWEvmWB
	KRjpgyKqr5NySm+czd7C9XoXhfiMRPnfkMnk5iHi1MJtgU+dJes2uAr5AfdrUk6TjwaWNoZn25/
	6B1CV4sNhMDvMMsjBzyGqH3zstqsx1Zo+AMtxLFyl9pwZbR+SapYe2kiXFCNf44QJlIl02HWQqC
	hNgB9J0Dj7EzycOTgM6btwCfMng==
X-Received: by 2002:a05:6000:2c02:b0:487:7fd:734 with SMTP id
 ffacd0b85a97d-4870cf2bab0mr7400506f8f.18.1789633833682; Thu, 17 Sep 2026
 01:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCPR01MB748139F059DF2459B9813416A4B92@TYCPR01MB7481.jpnprd01.prod.outlook.com>
 <TYCPR01MB748157ECB6B92D8E3FFD433BA4B82@TYCPR01MB7481.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB748157ECB6B92D8E3FFD433BA4B82@TYCPR01MB7481.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Sep 2026 09:30:07 +0100
X-Gm-Features: AcwNN1U8vjkIrSzMqHnYBmAsTNjSFszApsXoNAyb_ZFCyUrlOZkMUDMj9NBc6DY
Message-ID: <CA+V-a8vZZB0vwdgOxWm30_Jzv2FCrtNTna7PWMGeyEKcNK8otw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: pcs: rzn1-miic: Reset PRCMD state before
 unprotect sequence
To: Yoshihisa Yamamoto <yoshihisa.yamamoto.xn@renesas.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoshihisa-san,

Thank you for the patch.

On Thu, Sep 17, 2026 at 3:55=E2=80=AFAM Yoshihisa Yamamoto
<yoshihisa.yamamoto.xn@renesas.com> wrote:
>
> On RZ/T2H MIIC, writing 0x0000 to PRCMD resets the command state
> machine to the IDLE state.
>
> Reset PRCMD before issuing the unprotect sequence so that it always
> starts from a known state, regardless of any previous PRCMD activity.
>
Please add the Fixes tag; the rest looks good to me.

Cheers,
Prabhakar

> Signed-off-by: Yoshihisa Yamamoto <yoshihisa.yamamoto.xn@renesas.com>
> ---
>
> v2:
> - Fix indentation
>
>  drivers/net/pcs/pcs-rzn1-miic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 2b72fa98d..818756bb8 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -270,6 +270,9 @@ static struct miic_port *phylink_pcs_to_miic_port(str=
uct phylink_pcs *pcs)
>
>  static void miic_unlock_regs(struct miic *miic)
>  {
> +       /* Reset PRCMD state before unprotect sequence */
> +       writel(0x0000, miic->base + MIIC_PRCMD);
> +
>         /* Unprotect register writes */
>         writel(0x00A5, miic->base + MIIC_PRCMD);
>         writel(0x0001, miic->base + MIIC_PRCMD);
> --
> 2.34.1
