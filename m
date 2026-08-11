Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD600435503
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 13:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456356; cv=pass; b=JDIZSiS6VH7JXSNSGR5/lK7s2tAQ/NyYfX7v5FrMGslB2K9XdvxwtBhbs1SPm8qSycHoMons3Bie6jIy6X4OaAFQiMBOtya71xi/3GXPvAzyb0Jkro9pD+pQqjL8a8GWlDBmz5J+nucnZEZU9ZcleZqRJkg4Q1SRl1qCn7ikt0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456356; c=relaxed/simple;
	bh=jh0MoDST7A/sQpwYirQA6u5olw91Tkfk1DW6apY+ZaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJQFXVc0cZmqXba4poV/q2f/nri2f7a7wVBkKVCMaAn7GszkZ7UvtNxdWdu46mn7KBt8Sq2zRaqgy75QOLrRCRGaU4U7zpsbvOdSHjd9PYHAmO4CNXjyUlGsbIavakWv/lD/pVUoSK12I8NOp1L35qACDa5P7cto+Vm+FhZ9zFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+ZHdORD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idwr/e/h; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+ZHdORD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idwr/e/h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX7S41091534
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 13:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BkjMWmR1feHU62qjWV8aoheeQpabWNWyYsd2BQUC7H4=; b=U+ZHdORDy7jxTXWB
	olzmdDXClopXlhDRVV0CDWyBbhjsux2QuSvyc/WhRMK8bIWaOTgQVy8mBbkaOyr4
	el0+MqGf7c6hNht9+j5PX+2/9VBqr1xdctKEB/MlB7BVPVsl9l4Bm5FD0aG3uqCl
	86W5ssFkfM+WElcNDRQRjLUeXj1yk7q3Rjf4NgaaHq1WoIPpRIlM9PR8YVv/hwd6
	tRHP+BAMmvucH99F6wfj4qfen6PWVHCVh0XhQSDBw8vkXQ19G44jMCoU0aXcEpoS
	rs5G4NLoJyUF+p3+mJI+wP9T1xvket3gOr0Ml82SJw9KJLXGO9PieqptrnY3eJSq
	NHTFAw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049er83c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 13:52:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso4819745a91.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 06:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786456349; cv=none;
        d=google.com; s=arc-20260327;
        b=aXEQBFef+BlENS1Liq5+1bh1CQvNB3+4s9dUrPn3zeVfizdyz85qm61KbN3owR3xp0
         Fjy4exxdA8joqc7F3hQSzR8IVg0oUGZdS1SggX+sufbvhfIKui/e6z91tvy0o/gesg09
         p6tQB5ooeQiF/65VrwNKRq32tna6lToo8Mu0CJ9wUanQDC0oL9DGVVEgaI4BRLljKidQ
         PJeIRy2cWcJv0vQmi7jyhlNe7n3pHLVCw4Az8d1kaxWwdlnkX4ser5ISSoM1WFwvXUWc
         /1OaDNm6n1t+41MmOnrQpYO9N6pOCvxPFz8+Fu7Ui6EO9naBYGt73u/kE7+kysvoollX
         bG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkjMWmR1feHU62qjWV8aoheeQpabWNWyYsd2BQUC7H4=;
        fh=yCHiU50yLVv4IzU9TJksm45hmQmA8gzr0TMU0ZMKQmA=;
        b=myNRzeT06C0BqZQld49tt0B0H64TrmCbZtCckfjmmDDZuBxwIg9ceqEXayW6zJkE3G
         EDxV6KMS9oMr/yf8gQfj2Hd+z598NwrJqtWbXT5M6n4pi1x60KuErfdiDoUKZ9F8kMRz
         fJqfR1uset5PM8c6hWbenzBYQsLAg5NsnFd4nK+U995HwxXxNbs4vdGISU33wQa7jG/z
         jF0ZCa71uTicAvmqljR5t1cA8iRkKAciOfk/NElLuvkFaYV+UDwGD+mu5jbVirwl4wU0
         eTvPx1HDwhL3kPbAZyBioM3e3l7tCDzPTKDX6ZpbmpzVPS0W0qpW6QCX2ewcuzGxGawj
         NqOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786456349; x=1787061149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkjMWmR1feHU62qjWV8aoheeQpabWNWyYsd2BQUC7H4=;
        b=idwr/e/hQW4C4TjzDo1wfLs1LvQTrlhZicFCfpUhuqZmHepZDPuirHHW6PwJhcseDy
         ZsDfbzkVPat1YKpfTc+ldiQYPmJZs1cfBrfhtMAwZpMvACJUkD3cHONh+c04AsNxt5qy
         qj2HyJ9YPiv7gSmr3mq4uRmhLSfS802X00qoJsJEAmDnpzH+b2zt09SWtuzzGF8MNSaZ
         QTh3xbwf+cpBzcTxClI8LOHoWYgGsDh3VcK2E3o3ZIVzbJBkSA1S3Q24YwXy941a/LtO
         TB24M3un72zZ9X8sGH9waoGEsXRAAnQnm9AkOF2o8r/S2QON1B/UOGThWkPTAjmcPNyJ
         Fxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786456349; x=1787061149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkjMWmR1feHU62qjWV8aoheeQpabWNWyYsd2BQUC7H4=;
        b=JjIasJ//FL/WRjINxpJBJNb2/g+x4Xg3wSO/IneMG0FN5Tow0hE6dE9v1eSSSZVg/8
         w64HEgJaDSIPJxPXgvcO+kxoivFTfTVcJK7cJ7W86ASZGaUOEC6PaXgFmSKJZrzft+Ab
         YhHUlj/Fl0y5SeFVJwvxDNMmZzCB8sjLrpOY2XSDKOZ1dD7rwvCy2HFY/7FmBek3lRyU
         CkxuNZucwlO/Lz67yjL7WKrXS8kaO+UQM2YHu5piK5XVlRRXj5HpW/AmrYY9F1V+upUv
         jC6E8hvXoNfN3tqZtonQ8agDDqog6POF9e/HeOzllC5nZAvonlF1w0BKcpuNdfNoll1c
         QxMw==
X-Forwarded-Encrypted: i=1; AHgh+RosiCKT3m/LNCmLi0OlwzEYzuMkumq4qMNoIKZz1wccC5BbXpcJagP+161+xsp4W8MiKYBQdrkexdjk//Kv0qnLSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9TM547sRjteefvqdtHBcSyVz6Ihs6IrzSjujnoVqnWuY2mgn
	fnqcI7nq1d1j4b4n81LS74zIG1sixTAjW0iPfa8dBSahXgLD+0kLqCZ4kK2AjEdlwucq1jiGCNn
	oPqeMHRD5E/pH8m/1BMlTn05x/Q4yzc5AC2AtOA8hmHaL1nUpm2vvWA2lAh3sja4dCTdkXCNpn3
	RuFR6yVeAeY/+AI/qlOehQDFPItL2wcJ3kVcLSDK3FTNzW0S+l2p0xhA6EIoM=
X-Gm-Gg: AR+sD10a4NEib8hNSe1267s7kRRrk610Huj/YIk3+mEMAMOItRHtmsGsbF/I5DXCND0
	mmgwrylhvOMvQmTTLIbOHfU2OmTO1ww/4wnPJCqCjHnmjpSFlqup/hcackKGwSskHcO/7Ru8EZG
	LHQ2XIlKMMRsqKqC6z7kzCVaLsB0hwqRhO2boqrWZl63XM3wcZ7zs7NExWNw==
X-Received: by 2002:a17:90b:1b03:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-392ec5dc6d9mr3652677a91.14.1786456349062;
        Tue, 11 Aug 2026 06:52:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1b03:b0:381:11eb:d78e with SMTP id
 98e67ed59e1d1-392ec5dc6d9mr3652627a91.14.1786456348543; Tue, 11 Aug 2026
 06:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d4bd0cc7f26c1bcdc260edb994b4971cb5dd3a10.1786438424.git.geert+renesas@glider.be>
 <CAPx+jO-uXbNpFPzbAbDkBQh2-xf4r1NXk2PdQvOh9ZOfEQ71gQ@mail.gmail.com> <CAMuHMdXLsMfGEz5s9s3voZGbQL90hRYCxsfC==xsGs315XOHWA@mail.gmail.com>
In-Reply-To: <CAMuHMdXLsMfGEz5s9s3voZGbQL90hRYCxsfC==xsGs315XOHWA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 15:52:16 +0200
X-Gm-Features: AUfX_mybzQZwwCvQgA0yM2mL5trwMTqnwsNDzaQ5rlRRNSZcoScwQKtQyyGjVEk
Message-ID: <CAPx+jO9BAScZwWuxPUKr-hqGamGbjzQRjX9nHGXzXe2XCLugZA@mail.gmail.com>
Subject: Re: [PATCH v4] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfX+VHFXANUorah
 ZluLPI0lDnsNaJSdk/dpSpRNHv7T38akqZSY57bl1tmXwc9HDBNu+BoM6hrflPVTPmPt9+YgUPt
 94iBIK3r1XgvQ+93ufHC+g2o5DCXZNY=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b291e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8
 a=fImYK-f9FuHjHgKINGQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-ORIG-GUID: jo0nHkOqTzI2kjjpEwMhiC9OtCLht8IW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfX76AiY080mHQX
 2FxgL5Xxaqmarq7JoOgfiUzj/rcne6NLeJihjVBURV3wNkzQtyhgLiOqAZ5WOwSOSwAOuhcKctg
 cqeMhw6hfeU5+/bCRm1yQJlxJLYtr1zsMSUP1u/i15RLLIuujjRuzMFBlEbAkAXIPNsCJPdnRgz
 RPnlPokAIW3a9LmzDBAitgFZIoYm3oNHKJglgdP3AbeY0T22hFzQRx/nG6JS+VMmukJY1ss1Tek
 Ku4mmn1mkGO5lz0hsevJVF922keMG9Q11JVu3IINRBkvdwxKrPBS640fx2radLWpcvUpMxAri4I
 UDOBABvjXm37AcRcuK8P1sz+GDseoa3jlRr1vxEPw7WLcx1fIZYI2TosCywARGC85c67b7dX8Ul
 oSOoTXDsXXl2kcj9FxG9dOWWUAd6LFnPsmoXt1mIVGoulV1j8lhXGCwEou16VvaJqH8/dwuAAM9
 aI2Iwlzh95iW9E93AxQ==
X-Proofpoint-GUID: jo0nHkOqTzI2kjjpEwMhiC9OtCLht8IW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110116

On Tue, Aug 11, 2026 at 1:52=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Ulf,
>
> On Tue, 11 Aug 2026 at 12:16, Ulf Hansson <ulf.hansson@oss.qualcomm.com> =
wrote:
> > On Tue, Aug 11, 2026 at 10:58=E2=80=AFAM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) S=
oC.
> > > For now this just supports the always-on power domains, and dummy mod=
ule
> > > clocks and resets for the serial console (which is enabled by the boo=
t
> > > loader).
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I had a closer look at the attach part and there is few questions,
> > please see below.
>
> Thanks for your comments!
>
> > > --- /dev/null
> > > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
>
> > > +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain=
,
> > > +                                   struct device *dev)
> > > +{
> > > +       struct device_node *np =3D dev->of_node;
> > > +       struct r8a78000_mdlc_priv *priv;
> > > +       struct of_phandle_args pd_spec;
> > > +       const struct mod_map *map;
> > > +       unsigned int id;
> > > +       int ret;
> > > +
> > > +       ret =3D of_parse_phandle_with_args(np, "power-domains",
> > > +                                        "#power-domain-cells", 0, &p=
d_spec);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       if (pd_spec.args_count !=3D 2) {
> > > +               of_node_put(pd_spec.np);
> > > +               return -EINVAL;
> > > +       }
> >
> > Is the above check really needed?
> >
> > Assuming r8a78000_genpd_xlate() is used for attaching, then the
> > args_count must always be 2, otherwise we return an error code when
> > trying to attach the device to its genpd, right?
>
> That is indeed true if power-domains contains a single entry pointing
> to an MDLC domain.
> This check also protects against the (currently unlikely) case where
> there are multiple entries. But for that to work well, it should indeed
> validate pd_spec.np, too.
>
> Is this good enough for now, or do you want me to drop the check?

Let's drop the check then, as it's redundant.

>
> > > +
> > > +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> > > +               hlist_for_each_entry(priv, &r8a78000_mdlc_list, link)=
 {
> > > +                       if (priv->np =3D=3D pd_spec.np)
> > > +                               break;
> > > +               }
> > > +       }
> > > +
> > > +       if (!priv) {
> > > +               dev_err(dev, "%s: MDLC %pOF not found\n", __func__, p=
d_spec.np);
> > > +               of_node_put(pd_spec.np);
> > > +               return -ENODEV;
> > > +       }
> > > +
> > > +       id =3D pd_spec.args[1];
> > > +       of_node_put(pd_spec.np);
> > > +
> > > +       map =3D mod_map_find(priv->mod_map, id);
> > > +       if (!map) {
> > > +               dev_err(dev, "Unknown module 0x%x\n", id);
> > > +               return -ENOENT;
> > > +       }
> >
> > Would it not be better (if possible) to do the above verification as a
> > part of the r8a78000_genpd_xlate() instead?
>
> In the current minimal driver, the verification could indeed be done
> in the .xlate() callback.

Okay, thanks for confirming.

> However, subsequent patches will add actual data to the retrieved map
> entry.  As the .xlate() callback cannot pass data for later use by the
> .attach_dev() callback, the latter has to call mod_map_find() anyway.

I see. In that case, let's keep the r8a78000_mdlc_attach_dev().

>
> > > +
> > > +       dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> > > +       return 0;
> > > +}
>

Kind regards
Uffe
