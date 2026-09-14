Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96D44C4FD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387602; cv=pass; b=M9uTDuhS8K24UsPZjbKsXRBuYhQH2SwhRsvGJPMvR+MkZ2DKesGsFF3oHBgNFfoFVKkVniSOf0yV8lRht6s4JsgWL7WYSob0q3to5yu5zt8oxPqC2tY8W68ocraBEnhvvwxHAAINryoa7OH9ltQ4q8GhqhesCjIFvoV9F0q2eXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387602; c=relaxed/simple;
	bh=dAQLslpPj1WS5Id3+o7zx/jx5tvNIaiKqLwvi1h/rME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWSxG9RJJST+IzWkMbu14PCN/rlpxksEyMVV3MsrJkCfDym5P9MenKC0qjyMtDixJrrurgo4S/oQSO2K2/J4vqO63Sb4pwbMKmEqVuL7EiVi1yMjHUixELwLQRMnfPjTbBH9DEMccyZ15h4npy7GUnkhfTyQDKwc2B0rjSXy4yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+t5UHxD; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+t5UHxD"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso309958241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 05:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789387597; cv=none;
        d=google.com; s=arc-20260327;
        b=ceQ2L5Hlm+nZKkR+Zmuh7xNpN62zKgKZHYIe6HiMrLmKOXQiruQBIBFgeIm9Xa+iZX
         D9+AaOBiBPA28jvvZ1/MiB8adalGG9pK+/57KeqhUCM1FXj+UjY96ZoBqtVR/JTdPsLb
         VHc+B4FDN5QJmhLxi2y8zJl2fmpgnVTT8fREtBilxtevX0EaeZ3YbmdhFXPYQzmavg29
         etof4e9G4JI0rDGIDYk7+nu/Z8Xm4+v4iWwAkng2fNLJR0d0JHt4Z0rIIhkYM8HmBgvp
         2TGMeve8uHwxTHSdWhoFK5RaAs/uV8MtOLvJk9W7AFhc4hAnLCMjrIrui3pDSFrM8ROG
         peRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        fh=o/RXFEEfZoAXhNjlxtLG0TpdkpqN+I7Znh4JZdmjgII=;
        b=POPCUNo86PZESJzT9RoAiflojguMfNZtGnx9vzM61GSVHlDB6WlrT12mpCHJv/GwnR
         lT4G27Vgt6QzsJ8NcWslWYW+gtNGKb0qzlaCgDBQ7ItJNRDZeplOVz7jcfhKcVVe1SV2
         AU9wVPd72wM7AGqxSFag+V8RPtyMsaedc7zTpNPJE2I6L/PvoEDTfLjGJkYap90HiEe6
         SzOaZE7CQnixA862GIdteshIAbl342yvchY0wa5xm9T8YXBPMnzrVyoBz0oZW7vMxc5Z
         xC3d3UqRazO5MchucZOU5p1nyGDiDCLsdfVc4MOuh+M1Ru2wUm2UM8kgStilaDbWVEWU
         6BXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387597; x=1789992397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        b=T+t5UHxDGs+bcV9iWAS7LO+KmsIPI42yGhLz5oEfqs6SPEpvPhxF98Shja7irTkSLq
         A/C90OkRujFq8qSq/yEHy++HH4iUyE0wSYdZaaKK6F2/2rKFj4tGB9ITtt1mQyr/34bt
         ebt2S2et3mM2nyl/d+YKLvlyACRY+YDpQqKT3DF55ElI0wHLFCiVzMMA6Rzvy5jFWkdB
         G1+TFvJXZCt3+6S4Rd1kdERxfJ046GRc5bBg+qmNozXpi5i/ELXOVFqEwSZ6/yd88PmC
         Jk6mJbDS+HnoxWDvc5TeK0rws5vIEArdViBJSA3w790OiU+AKtN7CKmB09dkV0fJDfIH
         X95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387597; x=1789992397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        b=Mq8SsmcCs7G4+U62Z40MROeKi0/X6kWuMDXpmr+hnPgoLMg5gpiBnjNta9Az87HChd
         YDvGO6Rwqbeg7NXOsudxg9DRXvVAcErbatbBK6HDHsQONZSGLyC/WdQXrNtbF3oxXcPT
         JxhD/IJhlJ4J/UmOaxNZXXC9+3ww6t7hZuCPLjLNER595BmU9AaoFU7VOxRgntX1V5z8
         SSJ6Ak5SYJ6REUXK/se4Ly2X33zLg8/f+gaX/rHIyIOKBJDX1D7C9arRCRzyp+Q8FsI9
         kpe1GcKVevQGFZ/JDCNPzNm7SM0UBPqxkAR0VFVhbh3zetqVrWdWSnWpbD8Bnig9CVhS
         cs9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPYmspCjfrD5wCmL9uqmMM8Liqpzk+YBDJZ3WE2f6fUGayjnTbMEu38TR21Qiiocr1ZU7/+F4btMv2RSpQmxpstA==@vger.kernel.org
X-Gm-Message-State: AFuF++nqgHxR3/9WqupuBRZrLxScaKxGO1sA0ezKdyNa6g0IjVDgWfXW
	H8qroRlMTkq9WFzwZx56So+Hkgq0aThl3CtCFE8SsrFzAmGge8FQiugvw7/F2e7vxlVhGdx8yRf
	Oc7oSDQSTvKTlk4N9XP14F6j93JuVow8=
X-Gm-Gg: AYBFou1lJfkLWJnLGZ7w5t4Z4QBdrJK6107EnVzwmop5lPFEjH7Pt1HQx4MAtKIHcs3
	ND2rqM1vjwKRMZPyo1NMn/IhMaexRe0bfJhhNpol8VtnexS4QlsXgSepRAnZrcgm1T1JpZXXOf4
	q9o5+qj9hVayz5tJ9GKBwk6GsEHR4dC0akgsJvolA6scRa8i1zSCWu/c/hRkw6YL3Qoy7iC2R6d
	uSnZiTWepcSBRLzSjxvXOcUQ2LeEV086QZWeXMZWInNZ750YD95C/QESFKNKi/Gg7gVfJShLCDh
	b+1xegsqVp8gOUWb5kPBesMTleluQG2/8+7r5Jch0xAcjaFVOGPNf9e8SuIoeafEqH4e
X-Received: by 2002:a05:6102:a50:b0:79c:23df:6fc1 with SMTP id
 ada2fe7eead31-79c23df7745mr548775137.2.1789387596957; Mon, 14 Sep 2026
 05:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
 <20260907-chimp-pectin-20f4ea3b772c@spud> <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
 <20260908-dinner-atrophy-757595146656@spud>
In-Reply-To: <20260908-dinner-atrophy-757595146656@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 20:06:25 +0800
X-Gm-Features: AcwNN1WwTccuI-E0Tg8O_HU6Y7-t9R9kzYG63DP3-KVuGmrC7El7wKFW8D4dhcc
Message-ID: <CAPBH0A9yKhvDA_pda45Me1c0tXcSj3zLqLoFgUOQj3MES0Mk1A@mail.gmail.com>
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

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=889=E6=97=A5=
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Sep 08, 2026 at 02:31:40PM +0800, Colin Huang wrote:
> > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > > > From: Colin Huang <u8813345@gmail.com>
> > > >
> > > > Add Device Tree compatible strings for Renesas RAA229639 and
> > > > RAA229640 PMBus devices.
> > >
> > > Driver change suggests fallback compatibles could be used.
> > > Why aren't they? If they can be, add them. Otherwise, explain why not=
 in
> > > your commit message.
> > >
> > > pw-bot: changes-requested
> > >
> > > Thanks,
> > > Conor.
> > >
> > Hi Conor
> >   Thanks for the review.
> >
> >   I didn't add a fallback compatible because I only have document for
> > RAA229639 and RAA229640
> >   and could not verify full DT level compatibility with any existing
> > supported devices. While both devices
> >   are handled by the existing raa_dmpvr2_2rail driver variant, I don't
> > have sufficient information to establish
> >   a compatible fallback relationship.
>
> Given that the match data table looks like this:
> static const struct of_device_id isl68137_of_match[] =3D {
>         { .compatible =3D "isil,isl68137", .data =3D (void *)raa_dmpvr1_2=
rail },
>         { .compatible =3D "renesas,isl68220", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68221", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68222", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68223", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68224", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68225", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68226", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68227", .data =3D (void *)raa_dmpvr=
2_1rail },
>         { .compatible =3D "renesas,isl68229", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68233", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68239", .data =3D (void *)raa_dmpvr=
2_3rail },
>
>         { .compatible =3D "renesas,isl69222", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69223", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69224", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69225", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69227", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69228", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69234", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69236", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69239", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69242", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69243", .data =3D (void *)raa_dmpvr=
2_1rail },
>         { .compatible =3D "renesas,isl69247", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69248", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69254", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69255", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69256", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69259", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "isil,isl69260", .data =3D (void *)raa_dmpvr2_2=
rail },
>         { .compatible =3D "renesas,isl69268", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "isil,isl69269", .data =3D (void *)raa_dmpvr2_3=
rail },
>         { .compatible =3D "renesas,isl69298", .data =3D (void *)raa_dmpvr=
2_2rail },
>
>         { .compatible =3D "renesas,raa228000", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228004", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228006", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228228", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa228244", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa228246", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa229001", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229004", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229621", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { },
> };
>
> It's probably pretty safe to assume that a fallback would work here,
> given how many devices are served by the same data structures but
> maybe one of the Renesas folks on CC can confirm that for us.
> At the very least, you have documents for two devices and should be able
> to confirm if they're compatible with one another.
>
> Thanks,
> Conor.
>
Hi Conor,
  Thanks for the review.
  I found a very similar precedent here:
      Link: https://lore.kernel.org/r/20260325090208.857-2-dawei.liu.jy@ren=
esas.com
      RAA228942 and RAA228943 use renesas,raa228244 as fallback compatible

  Therefore, I plan to followthe same approach:
  RAA229639 and RAA229640 also use renesas,raa228244 as fallback compatible=
.

```
@@ -60,13 +60,13 @@ properties:
           - renesas,raa229001
           - renesas,raa229004
           - renesas,raa229621

       - items:
           - enum:
               - renesas,raa228942
               - renesas,raa228943
+              - renesas,raa229639
+              - renesas,raa229640
           - const: renesas,raa228244

   reg:
```
Does this look reasonable?

Best regards,
Colin Huang

> >
> >   I will clarify this in commit message in v2.
> >
> > Thanks.
> > Colin
> > > >
> > > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml |=
 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl=
68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.ya=
ml
> > > > index 8216cdf758d8..3537c7ddfb09 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.y=
aml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.y=
aml
> > > > @@ -60,6 +60,8 @@ properties:
> > > >            - renesas,raa229001
> > > >            - renesas,raa229004
> > > >            - renesas,raa229621
> > > > +          - renesas,raa229639
> > > > +          - renesas,raa229640
> > > >
> > > >        - items:
> > > >            - enum:
> > > >
> > > > --
> > > > 2.34.1
> > > >
