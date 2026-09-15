Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C174477E51
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465955; cv=pass; b=j846Pom8vB+HH0Usr7mBQbjiA8Toev+AdhaIsMWw6Fu6YDJ7wKJnhrjdGIqOBt+34qKfABikRL1RO/Lvrbs0BcU2Tx4eIvLo3zSrSR75RJFC9tvxOo+aWFtXrLB8QzTB543RF5ZI4iLMa6sNFRqNj5cyC3b4k5IjAVAVE0SQOPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465955; c=relaxed/simple;
	bh=kleVDMYuhTqWHiiaz5/KA5UtIuEbfxUGgfD3WLraV3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzwI/zLL4ktxO/7JdC/K4ygY5ytEMB+8JeI0S0cX7C6ZdPZoKEWj6+XTKe/X+Tj/8EqVRX48OgxHiu0R8fcOlSeHtvubQ7Z1wOlq6sF1C4ap76o01DSLkhcnXn6p7QorrNREWZ4Uek4kGOz5i4Mj/MMNox2zxaiI5xijIlYwROM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPHwoVfS; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPHwoVfS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so1351862f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 02:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465952; cv=none;
        d=google.com; s=arc-20260327;
        b=YjMsb6YXmRmHjhCYd3AHwo8FGNdx7J7o1ZF3kT3/SkdzBHww1M4VjV4eG27u7FOCry
         Lcx9TS8xNNTyCgmrC/gVl7TzmJEIdg2CqeC4Ut6syVWS+wm1EN9b0HsQ35EzMyxTafAr
         66ewYr1G6VFFU2K+i1SE1WkHAdFpGy6F0Mp8zo6lTMK1kUtudzAzd1M5Qo74DCgIrVoH
         PO2jXW2vhXSQr9YKZ+VipA4DFOZ/JZ778iqB97FtY/4uR7nOsaAkD5lysYxoWP88YVq5
         1N5I26i/0B8Qkb5kS9a8x7wAOLfcFJaAba6bVcfV3YgZTK80zj6gJBfS6EPW0gyAl5sI
         61Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7X3JQQW/vVbBs4H3OBezc3yA2MPhISEc3UYAiHRMzJM=;
        fh=5NhBa0771Ik7rI8ySERx/7S8siOGvPpLYfMkuayorw4=;
        b=SnHY756EyJxU1IJwphZ/lxrnc3LmU53i7ktTt8NhgHgq9wtVTwwYKWYA9Oq79jEySK
         UjL1HdS2fqPzti7NUvJVCsybcjrX80/bIJdwqL5grfqIkUGNqn6UYj4XqXlP08/OtENP
         uWNR+NB+bYqDurkgWxpMYSoq+vHJ2UMaLZxM3nY1oSmclbnzpizq/0+RhkaivEu0AqKd
         jUUgA8A4i9E+EGgAvA5fqS3ri8r1D6Dc8Zv8xGWl5P73KZIhNtIpFzflCX36fYtVBfHl
         rmbMrLKPScfPxm5e1G7keSKxBnUYrRR3TnNFHbKm8xPcXn6T0r24uMQSbj7NkM+gNv/x
         c6Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465952; x=1790070752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7X3JQQW/vVbBs4H3OBezc3yA2MPhISEc3UYAiHRMzJM=;
        b=sPHwoVfSj6BrgKpTUBwM1697kYu/qdzziYZuV+NwHtu1yV9Vp03SMctKzXp2ctQF8P
         7xc+YG9n5AMGeXKzdJuoQkiKAmNB6RB6+pHdZ0zCNpBCa1kJvKGegivr5I5NKiTYNtCr
         Lallpn7NKmyxLdcYP4YuJUNY6NwWJwwVc7WpWgHvLvsrKO0eMyjYsJObA3OyIq0ds3IC
         BqjjgVQwgLMQZkCK6GPCFefeedGQut99o6hnDNxl4J0fFufJBRPwTKzfvKKBj+WGmpvF
         V5lpBsMfXbWI4edpdyVZNap4MZIeLxm/ImQxF+4gBtNyQy5b8HLdP0EYaLyF7Z4tUBMS
         GWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465952; x=1790070752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7X3JQQW/vVbBs4H3OBezc3yA2MPhISEc3UYAiHRMzJM=;
        b=AFvt5ieuW/bIuBzgmE1fylJZwYw0u6lGaBgo6YuoIRnXtzA9si3KSqfObHlL3rvKYU
         VQSU5v9gGS4ahd9s3v1CyUblDeLhsfM28GHPTE7tWKoYonIRNKIaN8QEMlRxGFCYJlIM
         1rYCK/dIoseXaIbEu6nkb0ZOVr7JywYX0G4O4RRIeNCcg6TZ4Yc7nDpTh9+VZpwAV7R3
         X/jTpDsb2gLV3yKrIarJaTujhPkCofae1mz3nSVE8Zgz0n7P76sf/hNTZC71+/mgHRg+
         WsvvKnQrUUdbNLzXJeDcO9MR+tkFqAqlQIOn9vx7rxI6zyTZo9+UfsHcM9ON6dOkK25x
         6/4g==
X-Gm-Message-State: AFuF++l56Conz2RjUlDsAAYFoWqNaffAuFAnahf0Ttlgp5wDIMe5Tt7L
	m7KopiemvyvcB+A4EZ/KOtV/LIbtWO/un1RwSunSApbIV91E96bcoJF7yL5UzFa+RLKyoNzVaFZ
	NJQDW2RtGoHJ2afJ2M5xhHnShAz/8i3M=
X-Gm-Gg: AYBFou2QvaRVaJbSKhRWDSDE0xUHeMRtA5iJdGWHCPjSOMc69qyr8RrrdhI8UVMwKfE
	XNp2anLs8MsewN8kaaTxdLJA34LRw2N+g3IrTwy8MFu0/B0pmU3LyRmdpCxVx1E3hqzBfkAQYRw
	yOWxFVMM3kXLzCLy2NPkJK+zDvLzMz4F2VgXUqACTWscSFY+O0LVyQqsY0lVJsww8dsqFNFUJgW
	qmIko2eIaoKDJiRaHzKSat08aLAS73WFGGjls/WEoXLI/3pHXmpK1b7Ywzgofsi1hQhqmPxZLGy
	1Er6DPNM/q8+p6EjUrDOOEy0pRI0xNUSHWq+SWnLsbJ6jIUA69ueiUbZgqjWMfw+vVECs4gqj9a
	5aZXS2aZCVoxYG0Z71Y8aCNOLfCybJuuOGn10utGo
X-Received: by 2002:a05:6000:389:b0:486:f4ba:5c28 with SMTP id
 ffacd0b85a97d-487029dc93dmr8204463f8f.0.1789465951633; Tue, 15 Sep 2026
 02:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914211826.73727-8-wsa+renesas@sang-engineering.com> <20260914211826.73727-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260914211826.73727-9-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Sep 2026 10:52:05 +0100
X-Gm-Features: AcwNN1XSbJVkpUo9ARDYe1mGA1CIhRKQ7l2yI92j0qY9QoJJt-n-SMe6w14_6bY
Message-ID: <CA+V-a8tvnq-D5YKKCXhk_OiN406u4+UumVK9P5uSEJjU7b=E+Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: rtc: rzn1: drop unneeded 'start-year'
 from example
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:19=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> We don't use 'start-year' in upstream DTs because the driver does the
> right thing by default, ranging from 2000 to 2099. So, drop it from the
> example, too.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml | 1 -
>  1 file changed, 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> index ea7b039a91e7..e96007981c34 100644
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -91,5 +91,4 @@ examples:
>          clocks =3D <&sysctrl R9A06G032_HCLK_RTC>;
>          clock-names =3D "hclk";
>          power-domains =3D <&sysctrl>;
> -        start-year =3D <2000>;
>      };
> --
> 2.53.0
>
>
