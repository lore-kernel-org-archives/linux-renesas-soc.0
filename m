Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6574D30BF67
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202933; cv=pass; b=qbJtWcqJ9ik0KG+sGqEsXTFRWoqspMBw/e9C+TY/tnwvCbiFFChmMyc+PS4LMBWef/7uVh+vs0FIjVmco6pQIIVLpqIfqDmJ/0BQRoIjVfBZFFpDyhbjtzJqWIlTelLwewSeZG9d2dUqMD9FEiQy9fiicf8S+g91nk44319Mg98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202933; c=relaxed/simple;
	bh=C96NzncbsQ/25PKJxsR427vDtbfGh0/AwS/xdfMx8Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjyR5wOs5l/vcV0EETdqOsHiMTgioZEcv+Yv8FInywOT60wrnTP9Zf0McaMtkJUT3myfRTBMocj5DKuWIqEvftAlqOnNAXXvLBSIczb9Ca+mD0hC6mvK1sz/dMiEEHgIocgtDyLo1PXePMOqKRXDWIUGCpT6xPT0NcyXcHC+ppM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiudG+I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cpk51K3h; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiudG+I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cpk51K3h"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiN6H2678267
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 11:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=; b=YiudG+I2F1ZQxgZx
	4N6qfruU4OF2hA2wyVxhqfkKGvoLahO1KV2unqq18ca4FbN3VGsj3H26W7oPmV/r
	ntAgChfzQk8iH5qx5Il3dsmmMpD7n8bfyUw+XS/wCDAG7+xex4m6iVcoswaK3G1w
	gfaxppW5UM9uxEM0IMir5GZjLaH6hyYlrbspV/+fBLCzZtGqhlXJY1eG54nDCY7m
	AXCPgby3moriOiMOcF7ijZIKXpMMhEmPnSKlBNIfku2dWVJJKnvjTJPp4ijQ7f+n
	r/RnCcHfZY/MWXhgHHO8pkBzZ2qYiliIZFbaMBgfbIjmVkP9uBas28d//K25ES5l
	PFavxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1rq6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 11:55:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ebdfceddcso28896481cf.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 04:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784202931; cv=none;
        d=google.com; s=arc-20260327;
        b=AG/QSiqe4ZkrzOQ5RNDmFuNA+Y1isEi/eJxo1g/iGKfWxO3oRaKzFodMMjgbLrfylq
         ClXdXTsh9P76DBY/n5ui3lTyPzqlLGXEh1iiChg2rpn4oDhCi7tMlKIGc5CSvqHbYR+e
         RNsJ8HRrLGr+icPPiSV65+Vi+fSlW4rupWvdGnRUWm3Ef0t5yeW+XzgShHbldvGZ7NyM
         xoqrIyZ6o7S7ZOJfHqqRAnQjggGQdlZlezf3S49rjAWXv/YecP/RpzVd4iw3M/LPdU6W
         j39RZnsRyeIWd+QASdrg35MC6zEjFG07XQMFOilQtegSxQXbm0MpIBO56aHhik3aU86s
         iBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        fh=zxTRFQ16YYWUQVlDehkEnREQtFFO02FFUXKaV+DuDuk=;
        b=Z548BMNsJuVojxn/mpXv8iHePwnWHO6d71LOHG+6fCOgNBh1DxhcUv8f9PeXbF9njK
         QfCNISEQ/I0m3w7dW20VtlEZhWlad0lpykesfnHPMwesVYrHe6MFaZbwIQ2N/4HXhOFu
         pz54PUhWwCS/wOtsW1DuW0KJ7z+IMOvRdz3bIr8qixtn0w1MBXGhEJ699w2qmK3Us5vl
         akrf9K1G7krMAjIBbn9T54VtVih6PdOdMwAwaYitT/NjcqhXg48surm5X+GFl7vEWSCq
         DGFe5TDkwwC5dmSCEnLiDz7g5ho2+Xcd2PMRVpKNHUYiniT0c8vh/+CfWruLALNSx616
         MKhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784202931; x=1784807731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        b=Cpk51K3h6p9c13ZzNBF3eleyD8ltF4LKIO2g2GoQEDaTE4el6EMFoZ26YyVreg45sH
         acBDJaphcWU41sDGfIw7wrNWSXIvq8GYPh99gR0HiTMDAjM3L3n/af5uCJF6YedLXI/K
         zF9EdAAPc6utv53UH21fULRrMo4wbcDtBh6QOsVt4ceR2yYEQCIKaTl+RaK3QgcC67cZ
         kisK3cp+qlh519tdwatAr3StHiBKVNvztRTbfscHXAn4BSfVU93LLqG1PbTDAlTSpRyt
         /gj7DpmDNU0BVg9XIgjQZ8szsyfIAK/1lfew3MW3HjsPaaTAN8uNAPpP6upXsbQfXkMt
         sPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784202931; x=1784807731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        b=J4Ti+EeSxXCWNOxzPkEyxiUnriwc0kSIcxUkkjW5glRLxdBWaXuOswbuI7I4GpThXR
         6dIoTMuzrnjNs8MAuEUIlWxSoNwcgtQAnBPOfQPOFlr7BN0WAK4ZrA0NPCepHgvCkDiu
         yz6+m/SRQvympG8y9DzfXawV+SMeQqcAcgJKKFMHS0pFTW90vXRaDNMKpiy0D/78LMOh
         y5X7gO4VLPP309pLhah7ZuPmJ/CDtmcYQP79HrrfSPR/Aci7iVX2AKCabxjTA2EDtdQG
         sg2+swHbGZNy6shyy4K3Ua3lrGNHods85J9UUqTzsQYbCxR0SFMG8UnIMjBMh7bOpBFa
         7ebA==
X-Forwarded-Encrypted: i=1; AHgh+RqId35ctN0D8FaiVS85lDo95fmGYDO0W38xMEQdQz5YyiJzjhpKetk+wp25NpQ78F80RBtp2X46H49twI3aOPpFqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy313uBFTygVbfOXcpm4h1scXPKQBbAQiWqudR9jf9V0e7O5xBu
	MY9kENRChNlwIsw02AxACcNQ9dXouPQacpOYMF7M3+wLDx7NXNgz9brbVMzeHlQ5BGx7Iyvt9XK
	3KC3VNZEi3CKjc/S+4w/N+qF+UrNjSeGLzRiS04FWHK+IxOy4NK3tTTO7NQ2F3d2fQCS3lnkw4l
	SuO5N+gfQbRzO/rUTMsSo0EfW2m2CpU2YtFZMHUL+YkMuJbXxZ
X-Gm-Gg: AfdE7cm5h7e29dDyBeVjOhTAQc7KqUwKAacZid4Sj47m42RIL3IjsXxjo7/OScPhwOd
	w5OyQirpFrL8ncQPEvFmyvnou1LxIwS8vQWbnIBkygntgQq54G+53Vl2rGEP3jVxV9Hj7sp3sBP
	hkqNgmngHgCtD+cTYI9Aarxl6xsOWM9JNbHvM16DaI7V3ajDlzbpbpmtlE8Q==
X-Received: by 2002:ac8:7d0b:0:b0:51c:b900:5136 with SMTP id d75a77b69052e-51e4ecca047mr71644351cf.0.1784202930446;
        Thu, 16 Jul 2026 04:55:30 -0700 (PDT)
X-Received: by 2002:ac8:7d0b:0:b0:51c:b900:5136 with SMTP id
 d75a77b69052e-51e4ecca047mr71644011cf.0.1784202929904; Thu, 16 Jul 2026
 04:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
 <CAPx+jO-=LF9CvYDrC3O_GBtfHU6GYvq524OLmTG8R1-u27oyKw@mail.gmail.com> <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
In-Reply-To: <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:55:18 +0200
X-Gm-Features: AUfX_mwNMY8bmSOOoE3tn-LA0Fojd6Jz_KE9ZsYKsw02nHYdKrjLLMH4z5Iwnas
Message-ID: <CAPx+jO9aajD9eFTEUdAFOO-wC5NduaYhbDmYw5DHeFj92Fmd9A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyMyBTYWx0ZWRfX8af4RzjThkFa
 NMPyA2msCAb/QlrIs5036esrrONetxZz6bjGPsAqqm6p4QadbJ8cqvmavRG063g2qWqozRjKqR7
 Dz1jvjR6X0Q8pJV0uCccIjoieXNlge4qXMmF7QXXOCwbkKxhrE/i1+9bRpcFvwD8R7p7RAZeUUJ
 TT3rI9pXwMSBPGEYcx3cVGr1s+uLB7FC3Hh9pDVjNJzW75fLVzaAB03qmXaQsbV9XwIYUwrhaSo
 kjnXrgsuIX4dNxkYfZlXCnAItfxIdQhndjU5cVR82xGtZkAd/v4fTBMqbsytz9rELXDahzmW+OL
 eB0Q4zApZ8dZyuTyMCoy6T/i94kGpHUbhR4CJrN/AO4uoiWWj1+STWwcSubRgvr/nJMLy81dcEl
 hSiuVEDJRf5DxTAetpQwHzTWxfzTEmMiOKvYDE8YBqUh+gjy4h62gEAaBKtdaC2FQoHZp4/vEi2
 NuoGYiF2dWiqGC+A+xA==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a58c6b3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8
 a=AEl4uQJCqG-skdcfchQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-GUID: pRHuXCtHvOAFo51dPF2MfqEVtIpGlPyS
X-Proofpoint-ORIG-GUID: pRHuXCtHvOAFo51dPF2MfqEVtIpGlPyS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyMyBTYWx0ZWRfXzIaUofLJH9dt
 YfB9mlzMPHvxkrudsprIzCAAJ9geGt/1SPbbY91Q92IUaP9xcE5StZxwzBphMEBRimMPL+Uw8Fa
 DrW0AeonSyUR0rNaLK4JVxg6/jqMc3M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160123

On Wed, Jul 15, 2026 at 11:11=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Tue, 14 Jul 2026 at 14:04, Ulf Hansson <ulf.hansson@oss.qualcomm.com> =
wrote:
> > On Wed, Jul 8, 2026 at 12:15=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > >
> > > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) S=
oC.
> > > For now this just supports the always-on power domains, and dummy clo=
cks
> > > and resets for the serial console (which is enabled by the boot loade=
r).
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > > --- /dev/null
> > > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
>
> > > +static struct generic_pm_domain *r8a78000_genpd_xlate(
> > > +                       const struct of_phandle_args *spec, void *dat=
a)
> > > +{
> > > +       struct r8a78000_mdlc_priv *priv =3D container_of(data,
> > > +                                       struct r8a78000_mdlc_priv, ge=
npd_data);
> > > +       struct device *dev =3D priv->dev;
> > > +       u32 id;
> > > +
> > > +       if (spec->args_count !=3D 2)
> > > +               return ERR_PTR(-EINVAL);
> > > +
> > > +       id =3D spec->args[0];
> > > +
> > > +       if (id >=3D R8A78000_MDLC_PD_AON) {
> > > +               dev_dbg(dev,
> > > +                       "Mapping HW power domain 0x%x to always-on do=
main\n",
> > > +                       id);
> > > +               return r8a78000_genpd_always_on;
> >
> > This looks odd, but perhaps it's just a temporary mapping that you
> > intend to change later, no?
>
> The hardware has multiple always-on domains, but on the software side,
> using only one is sufficient.  When needed, it can be changed later.
> Other domains will be added later, in the else branch.

I see, perhaps add a comment about this in the code, to make this more clea=
r?

>
> > > +       }
> > > +
> > > +       dev_err(dev, "Unknown power domain 0x%x\n", id);
> > > +       return ERR_PTR(-ENOENT);
> > > +}
>
> > > +static int r8a78000_genpd_always_on_singleton(struct device *dev)
> > > +{
> > > +       struct generic_pm_domain *genpd;
> > > +       int ret;
> > > +
> > > +       guard(mutex)(&r8a78000_mdlc_lock);
> > > +
> > > +       if (r8a78000_genpd_always_on)
> > > +               return 0;
> > > +
> >
> > I guess the mutex is used to protect the global
> > r8a78000_genpd_always_on, but it looks like that isn't really needed
> > based upon how things are being called during the probe.
>
> Why would it not be needed? There are multiple instances of the MDLC
> device, but only one instance of the always-on domain.

Aha, I see. Thanks for clarifying!

>
> > > +       genpd =3D kzalloc_obj(*genpd);
> > > +       if (!genpd)
> > > +               return -ENOMEM;
> > > +
> > > +       genpd->name =3D "always-on";
> > > +       genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> > > +
> > > +       ret =3D pm_genpd_init(genpd, &pm_domain_always_on_gov, false)=
;
> > > +       if (ret) {
> > > +               kfree(genpd);
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to create always-on doma=
in\n");
> > > +       }
> > > +
> > > +       r8a78000_genpd_always_on =3D genpd;
> > > +       return 0;
> > > +}
> > > +
> > > +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct device_node *np =3D dev->of_node;
> > > +       struct r8a78000_mdlc_priv *priv;
> > > +       const struct mdlc_info *info;
> > > +       struct resource *res;
> > > +       int ret;
> > > +
> > > +       ret =3D r8a78000_genpd_always_on_singleton(dev);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       info =3D of_device_get_match_data(dev);
> > > +       if (!info)
> > > +               return -ENODEV;
> > > +
> > > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +       if (!priv)
> > > +               return -ENOMEM;
> > > +
> > > +       priv->dev =3D dev;
> > > +       priv->np =3D np;
> > > +
> > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       if (!res)
> > > +               return -ENODEV;
> > > +
> > > +       for (; info->base; info++) {
> > > +               if (info->base =3D=3D res->start)
> > > +                       break;
> > > +       }
> > > +
> > > +       if (!info->base) {
> > > +               dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &re=
s->start);
> > > +               return -ENODEV;
> > > +       }
> > > +
> > > +       priv->mod_map =3D info->mod_map;
> > > +
> > > +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> > > +               hlist_add_head(&priv->link, &r8a78000_mdlc_list);
> > > +       }
> > > +
> > > +       ret =3D devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, p=
riv);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "failed to add action\=
n");
> > > +
> > > +       /* Note that no actual domains are registered, just need tran=
slation */
> > > +       priv->genpd_data.xlate =3D r8a78000_genpd_xlate;
> > > +       ret =3D of_genpd_add_provider_onecell(np, &priv->genpd_data);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to register genpd provid=
er\n");
> > > +
> > > +       ret =3D devm_add_action_or_reset(dev, r8a78000_genpd_del_prov=
ider, np);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "failed to add unregister action=
\n");
> > > +
> > > +       priv->rcdev.ops =3D &r8a78000_mdlc_reset_ops;
> > > +       priv->rcdev.of_node =3D np;
> > > +       priv->rcdev.of_reset_n_cells =3D 1;
> > > +       priv->rcdev.of_xlate =3D r8a78000_mdlc_reset_xlate;
> > > +
> > > +       ret =3D devm_reset_controller_register(dev, &priv->rcdev);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to register reset contro=
ller\n");
> > > +
> >
> > In some of the error paths above it looks like we end up leaking the
> > data allocated for r8a78000_genpd_always_on. Perhaps clean up that
> > somewhere here.
>
> That is intentional: the always-on domain is shared by all MDLC
> instances.  If one MDLC fails to probe, the MDLC instances that did
> succeed still need the always-on domain.

Okay, so perhaps we should add a reference counting of it, to make
sure we don't leak the data?

>
> >
> > > +       return 0;
> > > +}
> >
> > [...]
> >
> > In regards to the merge strategy, I intend to pick patch 2 (shared via
> > the immutable dt branch) and $subject patch. Please let me know if
> > there are any issues with that.
>
> That is fine, thanks!

Great, thanks!

Kind regards
Uffe
