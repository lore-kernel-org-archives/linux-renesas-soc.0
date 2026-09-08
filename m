Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20899380FC4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849115; cv=pass; b=uBSVl+H9cN+SP161AUvkaprPCOWFErcMR/6BlUwxAUiSSfqHqP0PSYRqr5FoPbKkCh38OI3VqRrnCWb13fvNzPWIQDyILbjoummF5qpnmH1zroxHFBdflJPuU9rvuSkEvv71eSKwL0HSQRiXCeS8Cu6h9/HJYP2Aiq1IpWduaTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849115; c=relaxed/simple;
	bh=K1DnQZh7RTksEY/PnpmATjYf26gyDYwEwJXUsGJdA6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAiXAiPp9GY1Px/fMEFZ37OsEBnjaYU6iKpuF4abAnJytW/nyKh/j/UuTpmlWMuNxwlMD1w/M6jZ28zBhvMPto43NQImWrIhNt1ySmqF0UOGpdUHAejxlQHc92xxyf6/4n+hgEonE6H1JA/Zw0t5LXPRpqrvmvp2p2bID6vmOpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/oV6L8e; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/oV6L8e"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-782e0fc1e55so1150464137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 23:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788849113; cv=none;
        d=google.com; s=arc-20260327;
        b=eeW+gpcezlZMFD80HjSgSEde94ZG7NE62bxIdYgFeTmZigHrciPckZxMXksTf0l47/
         EACRXEwojOpcOLcYVNbPguFjVXpx1go3z1V7OdMiaLXnyWcW8Vljced2WFgY2Tp1VvPO
         SQ9lrCt6yNDQxjqAx9nnAxDcMUmWcJhfjoIbw9Rm83pETGW6r9bsRzSPsCqjX2GO9Ho0
         YlxLoUtoV4X8NzrOC041bLb2xnD8zggMNUNb+4dDqjn3xbi64PhndXGYvaJfI+jQMjlk
         sohhUIAoEAalzjLOe+lMFvLZiw2UQLSvKQ6iss15/hLJAsUny2A2OkSZTYiCbA6vsYkN
         5TLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        fh=Vf4h1mD4aoG+9veBVs13AcGIBlR4uMgWQ3Aheroepng=;
        b=HzrOua80k4ihHIR9eJZ/Z5FjQfbzmFU6GMHK/RhmSOzqat6sFSrKyClX6gGeLhpZ/i
         vE0gla8v5G+EML4Mt21ubLed28F1DoZ2461IlgVFckia3gM3HaCiF7AD5aJkcYiTE+B1
         UwNl3snHAmJ8H/FnXoLT0D9RLH6mi7qQSDB6QCqov6AvUH+QPcLNa1eVCyjLcG6G3D8m
         t/zSq/LVtW441HM0Xmbe78W+lSavMQwJlfqLs+sTJwULSO+0j1w15ORmxNzDqdqB8x6v
         HujXbknE+KmdYpIJi3WYddMzK7aCFPTZoz14KaQGPNdncPInpXsv3SzAOb/AxtGX87yV
         pRhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788849113; x=1789453913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        b=E/oV6L8e1aiLfGoBq7YwMle5u91Ur4uTXXkB72MF4JI6VtnAYx6NITO/tu2PmL5Uf4
         +TerQDVMNv53kBymdWmftUuluJhkxtzfEWKq6zxVqMcBiIHa9xksCuoZ3nV7PUlgoEzQ
         0qmuVsm/ZlFjkwonIKMPC/m5uL+NCOMSrD+y3K62v4JIFX0UD7l8ijoZ1IiwI0ZptScS
         DqaYol1xgwnx+9eHMtOyxlDf7MMfqImxU1L9dWFhvIFgVJ/yAvjzN8P1kHy0XHYI9zKu
         9SPBUP5E6NIjDjVz3QIfjCzVS1km7LdAfHE9uOFpVDCEscvz0PuweOQyL5uKVexOjP3c
         24IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849113; x=1789453913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        b=ChmOkJPlpqglMPlmm4w4pu9Bm6fETW3j6laGyYP7jkHEDOKgdFgxtZn/X6v1lGHQme
         fVJgG+TrqzH++X5PBrWuE3daBbaAGSUFJgWbc1pGgQvn7QUJ3aZaASTbu3svzE89qya6
         0lqIIhUL5/a2sm7eUHi2MguuAoySXFNaO+hS0hK/4HP018WfQmoUGz5QrErgshAT8q4P
         YUqj+wNVlfYqp/WqLwkB9QdAQVQFju1O97zhJ+x3VZXROe96ZWUkT7zLeyrRhwa03tki
         K3/yxB5DSZzOawQ+Gp8EKlQZ6bObtgFldwLd/Z6wg3ywvLUfv5i64ORg+/2/82tTqAKv
         91BQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyIfOZs/lKygLjRR3yRgR33m10w6F536y/PUFF2xZMRMMVp5DukLbhqg8IzaiJa8zZ5Y+HOCtToS3ZCzKDNCrPcA==@vger.kernel.org
X-Gm-Message-State: AFuF++kBzl3rPkKKv1Y/xKXqAcMFZK8d1e0kA4kRxXVgvyjPrEb2Ytkn
	J1slIcgV6oCT6aeoOW+XHEuAb3x13YW79BZd+CCZClvjZfr/a0cyih/lpu+iqTue+0i0y/R24gw
	esy+iyu30LIqtJTPwxiMRyjh2soaeGoY=
X-Gm-Gg: AYBFou0KTJHb+ZtBLzXrI34ePXcN7jViie1cnBykUAvO5toXGfQltmJhyXaT0nujleu
	4I15gYmqd2KnPqebJD6SxyUSC0dFDgJZ44qvqAGjAD7BdsREDm6xAzD4QzmKI57FXzJwBBHPIEy
	CMd5HzVTEBojj7amkR6sZSrP47N6wVFSCBIbbWx5HDGrntrUtuc8/AKfX+Ltcl2lhP/QSHi69zX
	5KoOt9Lfzd/TZ8UpbFOszTnwnHukEXVzXhw5lZtgKGIPQWHseCY4n9Jt/RFWabqsqnfhzT6Wecq
	rL5AxgFYdycLkBgwxUUBUjQdNTHOIfmTsL2u89G8aZZN+lA=
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-78a4a91077bmr9190993137.9.1788849112904; Mon, 07 Sep 2026
 23:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com> <20260907-chimp-pectin-20f4ea3b772c@spud>
In-Reply-To: <20260907-chimp-pectin-20f4ea3b772c@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 8 Sep 2026 14:31:40 +0800
X-Gm-Features: AcwNN1VlTv2SntxcoxVK5N-Ex2mESc274Ua-5DjlQCs8MlAthNoLCriEU_XA3R8
Message-ID: <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
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

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add Device Tree compatible strings for Renesas RAA229639 and
> > RAA229640 PMBus devices.
>
> Driver change suggests fallback compatibles could be used.
> Why aren't they? If they can be, add them. Otherwise, explain why not in
> your commit message.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
Hi Conor
  Thanks for the review.

  I didn't add a fallback compatible because I only have document for
RAA229639 and RAA229640
  and could not verify full DT level compatibility with any existing
supported devices. While both devices
  are handled by the existing raa_dmpvr2_2rail driver variant, I don't
have sufficient information to establish
  a compatible fallback relationship.

  I will clarify this in commit message in v2.

Thanks.
Colin
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 +=
+
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl6813=
7.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > index 8216cdf758d8..3537c7ddfb09 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > @@ -60,6 +60,8 @@ properties:
> >            - renesas,raa229001
> >            - renesas,raa229004
> >            - renesas,raa229621
> > +          - renesas,raa229639
> > +          - renesas,raa229640
> >
> >        - items:
> >            - enum:
> >
> > --
> > 2.34.1
> >
