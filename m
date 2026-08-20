Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02422D97BA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 04:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201980; cv=pass; b=Uz5sIUWzk7+RHPMq1CfHLXmkKhdZVUdTIYEABIjvx/Ttv4+0p39JiYGMKQNQ7eEnrTxs7UP7ev5s3jZS2f9xVd6B7enxkAudeM2HMdNMV4u3T5U5KhCjDV4DNXfvS9CTXTJEwLcg005iq0W2gurB31rz4yDzK/sobdZ+/2LF458=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201980; c=relaxed/simple;
	bh=zufc4WX0Sg8gho1/+Y5XWkaUuA6TVrZwSLGFlBgxd/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+O75SZDhmmOYOTQl5g9WVq3z9pZYedTK61sHFN77GPZEHAEmpRyJNddZ2TE3doe8YceN5PfhVyDf2TxeMfKpcRqQ4IZCNuZ2CzZCoo1Osxb1siVuhOKCdZKfjDI5UXpQjBeB4RYkKje6rW5fXuMRyqVVaCXvRSfmKGTd1SKSqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMB/tPJR; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMB/tPJR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499b02fc590so5542325e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 21:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787201976; cv=none;
        d=google.com; s=arc-20260327;
        b=cIipUhexpQgvimqBO+VvpRRwIatihjvLV7S4wfOzOvsNlm5a5w/X9cgX9S25evj0fZ
         zfrfZZpes8eyKrpvcn94hDASKWALIhGo4f6UhCFm9dLB7AkatCWIAL/hjZ+JdAwP20YY
         R3RF76LYtrHS3HChCHBi+CHR9DJX0L0bHFMneKFdt3MQoVBHXiuMUrl1NgrE8f+Qkp18
         vMyjiPsQkl8IgWdWdz0LIuj1RNmsKGHyIDSUDnG6usDcztJFmEU3fS1kS9WcgYKayCX/
         ND5wIsoXQsrcaaEcj12nnGGjXpF/mc/3mE5DTTOktbfoXQeHmIZYgWEyELVOFc+IomN5
         ldyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zufc4WX0Sg8gho1/+Y5XWkaUuA6TVrZwSLGFlBgxd/I=;
        fh=WDfXfP51RvDWdYoPuUzQ3Cz501Ve3itQM9wxuKvbsO8=;
        b=JjtNWpSqjD65nESGQkZT+pqn80hz7JO+2XXFpfm3nO47c8oP8UJKcIkzaCAvCkxSVc
         c9AhuPYxmUnnogd+wMDTU0sC+546OFLeqaH6enfUqgOXmcf0eoAzzgoL38OPIo2hidCR
         F1xSf+N6vY054yt2SA8InGeOOTofqW74ZwOZu015gO2y0AZzpY7LEdbrAI/UfQxPVxhl
         1pKP6Y4Ac4HHz/sJqxTYICdIDwWCOiNLf0AFIwOJNUUQRng8RYzxKARAdGkoeNVPLKjz
         oxOag2CVHGmFSFsQNLS+VY0IcpYcv/TcvKBkrlqFIYPCK+LFI1R3vpWv6WYKJ1MgJJ/X
         pEZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787201976; x=1787806776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zufc4WX0Sg8gho1/+Y5XWkaUuA6TVrZwSLGFlBgxd/I=;
        b=AMB/tPJRpP0yo/7wc/KwrSsoaov4t58vg5AVy7djDas6d/DZc/hwAAidTfhkEAbo9U
         Z/an9Hf8qGkUe937AY5oQ7GcfdwDuUnUh+khKjvAPnqPdURYkYpEL536SJlQFfP1T62p
         vpzxHkjxuCdu96pDXHnIhn88kyMG2dxMVDMQORxZzS7mcfg4fxuqc/NnX6acGNAdwf5s
         OGkmWdqHCJE01m1GeCs/uiiKYoWxScKsv+1YSxXNFsglepdN5wT4FI+UShRdqk1F4CIZ
         F8aCsb9cazwhngKGAH3W8IcaqLCOCSCekWWIg++mdDDaEfxCzDBsbD95PfbwfXmA1LII
         a1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787201976; x=1787806776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zufc4WX0Sg8gho1/+Y5XWkaUuA6TVrZwSLGFlBgxd/I=;
        b=cjOL7DqXikQqJNQsxiWrVWcg55twwof07DAHGE/Bk2m8ROBC2hI2znum/sffw6O1HG
         7P8C4GwZpDfXKVb9+v0XK1vvZh1PvWvgE7CUcG6vyF2//ROhXlAU3Otckc4i+qd+gkgz
         Atvozvpl0KuSRfsuvVB2V13lpFDPB1/id5mhjKQfaVOwQaazpNF6hED5TlWxdmis71RK
         C9iprZm1So0XvY4Nr48RLVk8yb9PBdvU9Z8mNSclKsgbVp1c8+V/DDHd6KVpStyjNyWV
         C5LFqm4bMDyL3fY35f/1q6MbfzbSw9rvKliAiENoD+VMnBDlHRvz2c1W3dzQh9OR9aQV
         jibQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3zrKZGSe67thZ0eUIUFsexuXmH8jGCehoMBFc83mNIlG895vKgITU3fUyKOxE91NdY76qk5Rxy6BUb91KJNt/5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGXHwVe70hqS5+RuU1fy4HovcM4Y+MtDAtKZStZBjNPUbYcjx
	Yl3p1ILHQOf7/fZ1GBnD2ssqasilCHJB3gHID7KT5rPylq1iqWSJcyCt3Rro5HWB7TUA3tCMIb8
	gXfz3gykkhkhwgrKRVsIOPmAgPeELpHn7afhj
X-Gm-Gg: AR+sD12BF4d90kCH6sCbS4WbDhOW7ZOj4v36smEr6gAQodCwYI0OjdsH1+WnTZRA7wU
	d7+qBsNcqkBwBZKyWco3I0ZdH/PAKlCG6gSpzdAx86a3sLs6QLuLNO5aj/RrnlwcgWA4bZqUS6W
	1Rr0X289H/EIG/bhvg0apGBqhi0PtvytWfd9Amxl05LaeygxGfY0gvPYNKfwBJT0Ss+m+B6RnMj
	2V2mXrbDRrsgo2RhPhQgBgl1o+upG7Sj5SSg3wqXyT84V4okx+Kr38ydYaOrKViK+11+vM5Z8O+
	OwkArBcs/xt6mm2PnJ1xhr8c1gdr1qxWpUkovAvdoRsE0iai9T+Y9iQC0nkOfOxcZ/32Pw7+eMJ
	PpbMsXxZuog1YfQwNTDBzXQypapPG43k=
X-Received: by 2002:a05:600c:4ec9:b0:495:4d5c:903e with SMTP id
 5b1f17b1804b1-499aa167256mr164468515e9.7.1787201975975; Wed, 19 Aug 2026
 21:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aoWsgnsw5gC6TCj5@shikoro> <aoYIF8zAoPNyJxXM@ninjato>
In-Reply-To: <aoYIF8zAoPNyJxXM@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 05:59:09 +0100
X-Gm-Features: AcwNN1W7S4-c--YpoPqDr1HOqwCpIkde2HyjoAoIKaemmqpjbHFxtS1AgXlkzFE
Message-ID: <CA+V-a8uuGAASraLTEk6PGWR-NrAn0xEAZBtY2_P6-6m5O9ihzA@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 8:46=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Thanks for the quick update. I have done the review now, but still need
> > to test it on my N1D board. I can do this maybe this evening, but surel=
y
> > tomorrow somewhen.
>
> rtctest still runs fine on my N1D, so for the whole series:
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
Thank you for testing this on RZ/N1. I'll look at the remaining items
and send a new version.

Cheers,
Prabhakar
