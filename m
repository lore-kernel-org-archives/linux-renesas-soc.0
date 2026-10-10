Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24330471D1F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Oct 2026 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791630739; cv=pass; b=GrZcyxQOlWwYWD0c57uvbvAF5wtgXzsnxRnFuSWQogiWQNVvq5RH+bNvFzVRrgPyKjnr/72CPcYlVAGj+XYqY6Rnj+jAyPXiQWOSz3XJ3vGEXgvE0mtdpC98gLcPfc1dJw1VRTI94O/OfejvyMvI7a5ZW4691VZ6HD0gMs6gHNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791630739; c=relaxed/simple;
	bh=md5oQoJphQol66QfbURRgT/HHzUasbyHUn6RkFFz5Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdBVs6loeUQXqKh2Wmkm0Yww653z7Ir2s/vfTE5vJJYBgOpZIVhWGgf1qD7rukK1ZtNsekKRplxjRGYZZ6xT0YTXq+/zYMxkwwyluRnFCSBtkvXvStg5fF0faJnp9U/laCop7ZhNAtQnca0+1rH59nkVpI/SfqiXCbxRxS977Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20251104.gappssmtp.com header.i=@nigauri-org.20251104.gappssmtp.com header.b=jMQIHL3d; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20251104.gappssmtp.com header.i=@nigauri-org.20251104.gappssmtp.com header.b="jMQIHL3d"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afe75f055so487924f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Oct 2026 04:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791630731; cv=none;
        d=google.com; s=arc-20260327;
        b=SinccQsmyMowVUqRSpdcbDmXwX5cd+GWkwqDqoGbzkclOWv9CKqMZXxyaucu4xlLhM
         QoARKx0K09mtqgMX/2/mbPDQbtxBtnfZYw6QQXmQaIujRsmzp2feVQZzuRc82Iurpfqw
         VKJ4TfETwogykVhF5rLkve6yiuiNJEcaKMDt/9Cz/lzG8IUB/3G+WpWi0Qn//2tE4l09
         svZ9kD3rjdyIfPp8+J6OvxRXf7DacsKX3CYxECEkyDUogLMDhmE44W/N//JhtlE12czA
         0k9FGn1HdQusZfeacJnPxYpXv6LIepqeYtuVhENBnjGqEUvQ2SQ9lbYDGRgHTEY5zosd
         mpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2iYyP1LxibJML28p8CbELojx4hp1/pLAXT4X+K0jWjU=;
        fh=1Vs2ow87PoD0LqVltgA+nrlhzf/8Owp9KLeRoyh/UGg=;
        b=WoIssYjrjI6kPkIodKSSnD7+GEb/gaqcWdWnANSD0gPsjCTImpLt9n8+1oUcDXpGrp
         tlguEGcV8hVTO84Yzdy1f6eckQRXbGxx/awyES5+GXXtpYz8+aVsX/2FnfBgjJLFQo6m
         kPUaAk2NfLIsKspiqJybUzfPeUQmfITPthCZ11NFjXFMNJB6gAERNSwkmL3fyZFLUCEf
         oxHsbuFMU13xoh9SmbwngN3og+uZk8pQ5nVLt2877C3czvGZk/fvre+XG5WV6jklXjuk
         BmxaRDEvH0nbFYRKp3GvO4kag1Sp8ztKjFUB8Cp8T+O1QgEkKhTpKgYbGm1i0NzpV5FF
         u6PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20251104.gappssmtp.com; s=20251104; t=1791630731; x=1792235531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2iYyP1LxibJML28p8CbELojx4hp1/pLAXT4X+K0jWjU=;
        b=jMQIHL3d/ahvcQ6BsHBNrBAF4nYP56SS9YAm4AmPAFL6DmFkjmZnSgHRE2wt7fYiuP
         T3Xctl/ZSBF+2OyFt9KabgQYzHTNrD20cU6R2CETxh5n9y2PU/JFM0A6ZfF+4qTYfDPi
         rHx6C1aY0AMRP4Th1ZHJwsOnP+otfYFKvLgHPL33eXl9wsBgF7S/r+HGKU+4PFN/aCdK
         6+gAwKsABnZIBooJvK60M1rr0YbKcjrGWmgqXC5XpEAUX7Sfu5yGH1GGdcEyRAlSlhgh
         Z4HAwuETuRxBWurYXbr/m9CsFGXTvgrdU/5BbYm8RhxUN1kzHB9MmSQpjzx0/tR3/8nu
         LlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791630731; x=1792235531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iYyP1LxibJML28p8CbELojx4hp1/pLAXT4X+K0jWjU=;
        b=G6NNwdMCuL+y+aCHiaKQKpdqb0hShBZsnr0c5uEwwcv8EqG4jmSpyzcTWhgZKvuJwo
         76SorEltH7EmllV8EjT6CKl+1mqUqREBGwBMpVWNwOSe7vHONu0H9uJrtaBnHLHK58jM
         VWTaLuVjysovvEDGr0mK6G9dvkyE5b8Qvm+204LY16kNJje9UlpAypRN42w/4mDkLPD1
         pJjXX5AAuxNY5DwOPXXaYQSI1+GvNfwV8EBcNpfoqJlBbL/vtrocPnb2Xe1WTU1zny2I
         7ugUe3QW1EM/z7fx9EoI0L0kXUVUB+/4LNvQFV9a7/x1dx6RDzH5HspB9KWITLZxfmxE
         SHgQ==
X-Gm-Message-State: AFq9FYLSQhmx3ZHQTjuoFkPb39Azecx0GtkFDlKe42QBID22w/NjOfJQ
	QHo5vyoIjA4Klv3mEwD+Fk/tzZ0VInT14IZ+UFjv5xoKfjSODXnC8rCMrFiWZtnd5b2udIeHcV1
	+bZ9icMyg+JuZE60ZHdIyP82EQmOvpTezbTVzk4k=
X-Gm-Gg: AYBFou0GO0w9G4U5zX0xZy7xQxxce2EqO5e04ZvxiLbq6Qiy8CdN0DGt0WWbcGKZ3aS
	Z7pCw0FlbhVxEIHxsTHW1sWPG/7ogmT60a70IIuVff24zIX07xCQ7dW3iHZXwihVrXIw0fZwd1L
	W+oley+44nOc6h46Yta5pZjcOGJmHYkjNciyUBb269deVy78BhQl8FZSKYVgyrUH7fdMgZCJkZY
	yB6p3e1qFQQdtsL/nO5451Ah/UP11Yr2t56OEYaFOT33MgUkXBDfyJpNF1Vp4VKb+dO73KAVegp
	g//P3aVqpsvfM6hX9KDAXhwlTVKsPbaba+QVdhliC13v2hSPk5AFW0zSqj9zL8DMnQ==
X-Received: by 2002:a5d:5291:0:b0:486:f3db:e0f2 with SMTP id
 ffacd0b85a97d-48dbaade0b3mr6036971f8f.14.1791630731034; Sat, 10 Oct 2026
 04:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008201953.34307-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20261008201953.34307-2-wsa+renesas@sang-engineering.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Sat, 10 Oct 2026 20:11:43 +0900
X-Gm-Features: AclHuK-PSyRsX8cggYxKA7ZFI2xxYlvObXFkyui2LHRAXrkPEmOXGux92QpuC2w
Message-ID: <CABMQnV+U1xFSctKwkUkjriJwarD6QwGJi5tzQTerrK5Rio7e8A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: rzn1: add resets property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=E5=B9=B410=E6=9C=889=E6=97=A5(=E9=87=91) 5:20 Wolfram Sang <wsa+renesa=
s@sang-engineering.com>:
>
> The RTC on R-Car X5H does have a reset unlike the other versions.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Passes both DT checks. Kind of fixes 3b3fdc9fd40d ("dt-bindings: rtc:
> rzn1: add R-Car X5H support") in -next, but we don't use Fixes: for
> bindings, or?
>
>  .../devicetree/bindings/rtc/renesas,rzn1-rtc.yaml          | 7 +++++++
>  1 file changed, 7 insertions(+)
>

Reviewed-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6
