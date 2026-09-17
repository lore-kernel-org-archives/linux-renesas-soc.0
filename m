Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF3F3AD539
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 03:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617474; cv=pass; b=vEEuZKkdaP6djj8tE93cn+EiND6XS1wGEJhyLl4bZXZN94DBtjrb38+kbfHkihpZYjAKkopjRTJaI+9IlOiLbL1eGX9l4egptGOsf+bZLlj6wluKz7bGtu3eBkYTfLP3XlS1VPRA3dzsyrz1E0vfJS/bycJXcQ33cA00xi5u4So=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617474; c=relaxed/simple;
	bh=QZDQFrqT//xAlMZSMIHXxRacLP/53JmUTQhvgHqdImc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxwXsuNePAwe+qNzsRzQLsUVmmG3ZYQNx1zvifEIBB14210ZV9f1UkP83HBo6NyL9HErYLgw0zvxp4bo7eKJzXS4GGMCUFKprIHyIhnVVgpDIt4BMCiJyWwMFOzoIPij7u55+cjLdtY97dj5sHO+Bpqqx6UDdXssO9mHoa6VYHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Un/FedW5; arc=pass smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un/FedW5"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e4fff62so103330e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789617471; cv=none;
        d=google.com; s=arc-20260327;
        b=jKgjxxgPE4YHk542x+Wc25IJMViNdrZRPt7cBKcHxvW+aTZviUvoH6UqzJwmbMI2Xl
         w+yjANVtqflSruPkGINK/ZR7YNfgH1OaBZxES00d7EqlHQK6hl4RVfEbM528iGKjQXLY
         b6yioBp1jCZPLHdD2T5vuAOCIewWwOCKq+o2YocPbQZl23VD9xUfTClz+ZpwuzYBLErl
         CBYNzA9/aXOzqHs89dlACkNJ4Z/C5r23lOHFd5iFrWF7VUczCmWWpkIKlNpXd8/WuEa3
         aUEpmNwTNLeNz5VcFHGq5CAQoqxKp8PmeWDI3KJM+rqK0xGSuDO/fue0ORmPlxZMVkUx
         jKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RCkoPqFTOwYe3ybrEe/kvAczlJcQA13QDTHKtLgag7U=;
        fh=5Xpf/Aj5Nm+bVut39/Ku9CzENVZ3xuuZeYCke+CQGNQ=;
        b=Beu66kFGYDmv+F1qWAQ5pCX3Xje/lu5hwyZl5YOtMjbLDfDoYJ3LXkYG+S+me3ql2+
         2cSlOh9ypOnH5laq8r+pg+v95U8aZysjfi0VZdv7AQ9jXryUUnLWDfeMJDMEp3KYqGkw
         rb+GM9WZ1reGOVZxTWigNq75qaxebmmIQZdM7asVku4ix39taAPUwF1RCQQWEX5x00hx
         iW4o/3ttbFzenstdVEe9JTQtljyiPZsfaV0P2Wvtt6eZAUY83++LTyd7cjMlanuvm++G
         aIv501TAlawHB+W40sQeSInYmub9cemUxcVK8z6h1y4x3RU2WLuhU1R8YaSXYCqR0z7u
         VbFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789617471; x=1790222271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RCkoPqFTOwYe3ybrEe/kvAczlJcQA13QDTHKtLgag7U=;
        b=Un/FedW5UqVRvbbh4CSnowmccvd/cbjvm3ArxRzbEWWtQQfNHkf0Ufbxl8H2I31uHE
         pMlQayKkiTyrX+WL09hIuqRvmaNMwYKukAbSv17DK62iy38JsSosYHuatBQXttuXFkSE
         QIKI6uZcGPDtrc62cICPl13JM2kAgWo7iSmgkyw3Vrf1XjCgCxjKdDwaQTZCEHj3TrfE
         rjzZOxes3QDreZfKG0azyoslh9wcxjbZ98Rw5Aq+RJzfcY9C56PEiV1KQZEkRGXgz8oG
         S6Z3PM7rlTjRQjO2JVWit6hUK1asX5j1kQDIIa6DsYMOZRS8joR7HsDiDyYoDBMWNxko
         gP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617471; x=1790222271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCkoPqFTOwYe3ybrEe/kvAczlJcQA13QDTHKtLgag7U=;
        b=OY+VXtXzj/nWFL5jjPfL+5OnDRYwh/iQ8jVrkQRuLz2dwtzde/GZ5IaMjUc+rmgu+B
         HoPZ8Etx0CoeGjIpYOAbKQrhYs3/vnylyg9RfzpGz9wK9B/NK9RNZfUaJkGvfAJwLaJP
         BYYoTkmWq22rB7Mu8h+OwM0/QGIzkVhWuG0iDIFA/l4hQSZoWS/MjjVfvFBpr6pntMp3
         RyLML/XecPTiT2iM3srrIzhlvAORRAxNF2JwXJkNhnNofeNUiL6U7dA/HI8rsaSum9U9
         OG0ziTo4fqKQ39BTZr7n9zQqBw2HwEs4pEe74RGbTFf19OmM4dIfcC7xFNZMVA6J0lE1
         vSXw==
X-Forwarded-Encrypted: i=1; AKwUvBzICpuGlnuJwnotf+8Z1d9oDm1kEGEg955caWYMXM9qn8KMXQn21pG1jmX6IkF+nL5AUSKTmHxrUbt0Qb5vwYG9ow==@vger.kernel.org
X-Gm-Message-State: AFuF++lT4weuTS5SstUGacypoG7dLbCMunR1RS6edqloIgJik+Cizs+a
	vS/9kkSZ3sQYLejQJWD3XfKPGrfF+aXJQ+jcO/IOnSP1pojI4ug8yq5h6gz7b7NwkWr9kTQMlVi
	Of7F7eDoBdcYj24y2uqteT0lVeiiyj9g=
X-Gm-Gg: AYBFou0hG7yS+ulWzVNz0WsU45L4lyNO9Qz3zMieyaATPYR8/mLLDjAC187pCg4jo78
	8gC0uB6nYSBtDIVLzTx/SYcMuYLElO8mz4GQa4HvSQapdUdkP3z4wrIywlg4Xv2u2hG14LS6/g3
	wGEYuErazaNulH1RlGFd+zqJtTkHxJYsjxEB5yh/Calyptl9STEScZ13mspfB7iUricTKnXeIlR
	AaWE8UM4nzQvsIdXoEVWFEtNrtPH+1HPGl0psYN+jcl2cq6NCCL8dc403IkIEj87/KpUQmrN1D2
	nlfgd0nN+noy1IIr/0Lb7vzBGS5sWoDixNE/NGK/xIZ/ipOstz8Rn8QzAQ==
X-Received: by 2002:a05:6102:5121:b0:79f:45dc:118e with SMTP id
 ada2fe7eead31-7a0263727eemr4957458137.5.1789617471502; Wed, 16 Sep 2026
 20:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
 <20260907-chimp-pectin-20f4ea3b772c@spud> <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
 <20260908-dinner-atrophy-757595146656@spud> <CAPBH0A9yKhvDA_pda45Me1c0tXcSj3zLqLoFgUOQj3MES0Mk1A@mail.gmail.com>
 <20260915-showcase-reorder-e3c4d45eff60@spud> <20260915-recognize-activist-733d145c0ca7@spud>
In-Reply-To: <20260915-recognize-activist-733d145c0ca7@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 17 Sep 2026 11:57:40 +0800
X-Gm-Features: AcwNN1VrNcAwBNna1EDTqdfzEQKrVEmI67efoueReVinzmjRkDLk6TzzxfA2BgY
Message-ID: <CAPBH0A_UGsiSV8G0aM6DDnytrPNCXYj-6y8MRdmDj9+GgoxBng@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8816=E6=97=
=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Sep 15, 2026 at 06:00:50PM +0100, Conor Dooley wrote:
> > On Mon, Sep 14, 2026 at 08:06:25PM +0800, Colin Huang wrote:
> > > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=889=E6=
=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:57=E5=AF=AB=E9=81=93=EF=BC=9A
> > > >
> > > > On Tue, Sep 08, 2026 at 02:31:40PM +0800, Colin Huang wrote:
> > > > > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=88=
8=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > > >
> > > > > > On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > > > > > > From: Colin Huang <u8813345@gmail.com>
> > > > > > >
> > > > > > > Add Device Tree compatible strings for Renesas RAA229639 and
> > > > > > > RAA229640 PMBus devices.
> > > > > >
> > > > > > Driver change suggests fallback compatibles could be used.
> > > > > > Why aren't they? If they can be, add them. Otherwise, explain w=
hy not in
> > > > > > your commit message.
> > > > > >
> > > > > > pw-bot: changes-requested
> > > > > >
> > > > > > Thanks,
> > > > > > Conor.
> > > > > >
> > > > > Hi Conor
> > > > >   Thanks for the review.
> > > > >
> > > > >   I didn't add a fallback compatible because I only have document=
 for
> > > > > RAA229639 and RAA229640
> > > > >   and could not verify full DT level compatibility with any exist=
ing
> > > > > supported devices. While both devices
> > > > >   are handled by the existing raa_dmpvr2_2rail driver variant, I =
don't
> > > > > have sufficient information to establish
> > > > >   a compatible fallback relationship.
> > > >
> > > > Given that the match data table looks like this:
> > > > static const struct of_device_id isl68137_of_match[] =3D {
> > > >         { .compatible =3D "isil,isl68137", .data =3D (void *)raa_dm=
pvr1_2rail },
> > > >         { .compatible =3D "renesas,isl68220", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl68221", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl68222", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl68223", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl68224", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl68225", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl68226", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl68227", .data =3D (void *)raa=
_dmpvr2_1rail },
> > > >         { .compatible =3D "renesas,isl68229", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl68233", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl68239", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >
> > > >         { .compatible =3D "renesas,isl69222", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69223", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl69224", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69225", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69227", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl69228", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl69234", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69236", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69239", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl69242", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69243", .data =3D (void *)raa=
_dmpvr2_1rail },
> > > >         { .compatible =3D "renesas,isl69247", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69248", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69254", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69255", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69256", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69259", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "isil,isl69260", .data =3D (void *)raa_dm=
pvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69268", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "isil,isl69269", .data =3D (void *)raa_dm=
pvr2_3rail },
> > > >         { .compatible =3D "renesas,isl69298", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >
> > > >         { .compatible =3D "renesas,raa228000", .data =3D (void *)ra=
a_dmpvr2_hv },
> > > >         { .compatible =3D "renesas,raa228004", .data =3D (void *)ra=
a_dmpvr2_hv },
> > > >         { .compatible =3D "renesas,raa228006", .data =3D (void *)ra=
a_dmpvr2_hv },
> > > >         { .compatible =3D "renesas,raa228228", .data =3D (void *)ra=
a_dmpvr2_2rail_nontc },
> > > >         { .compatible =3D "renesas,raa228244", .data =3D (void *)ra=
a_dmpvr2_2rail_nontc },
> > > >         { .compatible =3D "renesas,raa228246", .data =3D (void *)ra=
a_dmpvr2_2rail_nontc },
> > > >         { .compatible =3D "renesas,raa229001", .data =3D (void *)ra=
a_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,raa229004", .data =3D (void *)ra=
a_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,raa229621", .data =3D (void *)ra=
a_dmpvr2_2rail },
> > > >         { },
> > > > };
> > > >
> > > > It's probably pretty safe to assume that a fallback would work here=
,
> > > > given how many devices are served by the same data structures but
> > > > maybe one of the Renesas folks on CC can confirm that for us.
> > > > At the very least, you have documents for two devices and should be=
 able
> > > > to confirm if they're compatible with one another.
> > > >
> > > > Thanks,
> > > > Conor.
> > > >
> > > Hi Conor,
> > >   Thanks for the review.
> > >   I found a very similar precedent here:
> > >       Link: https://lore.kernel.org/r/20260325090208.857-2-dawei.liu.=
jy@renesas.com
> > >       RAA228942 and RAA228943 use renesas,raa228244 as fallback compa=
tible
> > >
> > >   Therefore, I plan to followthe same approach:
> > >   RAA229639 and RAA229640 also use renesas,raa228244 as fallback comp=
atible.
> > >
> > > ```
> > > @@ -60,13 +60,13 @@ properties:
> > >            - renesas,raa229001
> > >            - renesas,raa229004
> > >            - renesas,raa229621
> > >
> > >        - items:
> > >            - enum:
> > >                - renesas,raa228942
> > >                - renesas,raa228943
> > > +              - renesas,raa229639
> > > +              - renesas,raa229640
> > >            - const: renesas,raa228244
> > >
> > >    reg:
> > > ```
> > > Does this look reasonable?
> >
> > It does, thanks for the update.
>
> Actually no. The idea is right, but the specific fallback is not?
> You added to the driver
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl6813=
7.c
> index 2f7f825bfb69..53b44775ba1e 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -456,6 +456,8 @@ static const struct i2c_device_id raa_dmpvr_id[] =3D =
{
>         { .name =3D "raa229004", .driver_data =3D raa_dmpvr2_2rail },
>         { .name =3D "raa229141", .driver_data =3D raa_dmpvr2_2rail_pmbus =
},
>         { .name =3D "raa229621", .driver_data =3D raa_dmpvr2_2rail },
> +       { .name =3D "raa229639", .driver_data =3D raa_dmpvr2_2rail },
> +       { .name =3D "raa229640", .driver_data =3D raa_dmpvr2_2rail },
>         { }
>  };
>
> @@ -506,6 +508,8 @@ static const struct of_device_id isl68137_of_match[] =
=3D {
>         { .compatible =3D "renesas,raa229001", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229004", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229621", .data =3D (void *)raa_dmpv=
r2_2rail },
> +       { .compatible =3D "renesas,raa229639", .data =3D (void *)raa_dmpv=
r2_2rail },
> +       { .compatible =3D "renesas,raa229640", .data =3D (void *)raa_dmpv=
r2_2rail },
>
> but the raa228244 uses a different bit of match data:
> > > >         { .compatible =3D "renesas,raa228244", .data =3D (void *)ra=
a_dmpvr2_2rail_nontc },
>
> So you need something like
> - items:
>     - enum:
>         - renesas,raa229639
>         - renesas,raa229640
>     - const: renesas,raa229001

Thanks Conor,
   I miss some information to you.
  I will modify the compatible to following, because they don't
support temperature 3.
 +       { .compatible =3D "renesas,raa229639", .data =3D (void
*)raa_dmpvr2_2rail_nontc },
 +       { .compatible =3D "renesas,raa229640", .data =3D (void
*)raa_dmpvr2_2rail_nontc },

so.. fallback  will be like following.
      - items:
          - enum:
              - renesas,raa228942
              - renesas,raa228943
              - renesas,raa229639
              - renesas,raa229640
          - const: renesas,raa228244

Best regards,
Colin Huang
