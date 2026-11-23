Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795439801;
	b=0lpA1KNJIqtDSZUNz46MY3OC3eaUNGD5rq8QR25BISsdUQcvX68jf36eG4nzq6dkMjUq
	 38pbWbC0o8Z9InRbMx0+3CH1fpS1y+uLi0MGLcLqbtS3fXq9igNLyL2iFmJ/u7GXOwb8f
	 hWykAIdKiDEjK27OVvEoAD23Cw6ZtsC8qUseZg3G6PJ7cC4YZNWIpAKIhNoaIRqIWuMsQ
	 /pr2QCPrpLHtqNk5J8vOCWuGdSL844WioNR4Umq8M0ktY/GeDG60506ML2spxfPBMqmho
	 zbRRlpUQN5gWvs5LRhr5Z69BP6K32jO3N+HH6pIDh+3ifyqOcUVXI+Cb0JF/R2p1iLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DMUZrzoWcw+UiyFceMO3Bhc9RRCN/ckPjei7y/ASaQU=;
	b=oOsG0NW1Odhi09Tca6PuGt8lTkbfiN7MKhAggp6mSsZYZ5YVsgwmnLAJAW7or8ZJanvO
	 mm/IegbdmDoI99MtCEQXUDslU9nFCAXtLty4PRWi1dai0r5fEujkx8iKdeW07StO7/f2I
	 h7rubAL8mOWQhARfPsaRMGrRFwoseetnp9x4wDpiCHhHzEHeAt3Nuj1c/4NmsRwfrfpku
	 gXueLnENtDsy+gaTHFN7BfivIcGSkQd5udIEen/nOitSs60y2Ufeubk7ZNj5EGGkjb8kr
	 7FcYpQcko9PnfI+AiYzJr9crwikuJh3at7iSjmiSJtiL7Ux5ijCyQC1W7R9InhLzXyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f3OK0JpF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D0E606A31E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D0E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f3OK0JpF
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1526156f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795439799; cv=none;
        d=google.com; s=arc-20260327;
        b=ZP/jjnF5UN+TNBHzvZhmqfw5wxLM0L3M3lbNNeh1iKgM4crj3pHk60yKLhMBdDrWWi
         Fx7dfFnUOKpvRJxpi1s5YEFiSOUNkK92kwXxYVGEyzB5tT9lcN08Ki+whFb8F5hGOInD
         6wWikSFTYVAUh3VB3ynCmsr7/76E2vNoV9eZQU3nEUjC1RrnphJwE49+Aa89TesCU3SY
         HefYunvVmoRuQwzSQMXG8jNC9TswrjmCM/LewPCSZLSoPPYgMzBUnzqq8b5E6V5N5O8W
         Nd8ZH8Nfai7KTP7rLRKgpcb9H9YEuayZ6XiwXpk2sBVrHeifaL6T7nsRsg5SWE1/R4OW
         /VQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DMUZrzoWcw+UiyFceMO3Bhc9RRCN/ckPjei7y/ASaQU=;
        fh=2fxu8C5r8vtP88IH05gjJxKRB4TOKzYOnoTuj81QsIw=;
        b=FmfwBDQsZ3MdFekaD/c4Oio0uCRO4DmS1Oua3ZxI0/APbPieiW20Pwsh2wnk+83FEj
         ZUhymcJVGVWoOriuR+c6TT71wFAvhvmUgW5mMAdI3LhJnhSk4whd5SggzrD2nmt42sKR
         fmd6oBnDA+HYtTVcwWqQdkzDKzoTB+wH8FB1imuKkdaI7Fy/j87XHst5mJQs7gyl+j0P
         ouXpTCwkazy5aEmzp1CQlabUbYyCqFsEklkiKa8GDeaGKB3IPny14n/tBmDuQW/uuoF0
         fNFENWtA+2uSBOjsgOs9MdQc1uWYNssB+DzdELLWtpzFjnCcqww7scWSnJhemiBF8j0t
         SwXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439799; x=1796044599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DMUZrzoWcw+UiyFceMO3Bhc9RRCN/ckPjei7y/ASaQU=;
        b=f3OK0JpFmCFgD32tMRqFiQBBxu9w/4uQiav7PKHwj4d57cJASbOto2Zd0VYy/O6xh/
         vkMts6TC5LSuwaZ6ps3OWNc3TRFtlaUg6uWYTqLUoiz8Gl8dM0uhkXQGPc7GxYBFtOcS
         bRsaRyZgTMA72k74IHIB5AZLWtyRN5NfC45pNI0kBrOvNhsE1orG35OROSAoecYDWr/C
         8o0dwB0FZAa3f5Vn2/v7XwbqE5XArGLljlVAr2SF81dUA3KxQyeltFYugwHC0eA4UxiM
         xFQao6As575MonCt6VWEZ2X1SxO+uI0ktspzxoAt03SWzUJg61lycEfUdHNnxqmqstyo
         YtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439799; x=1796044599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMUZrzoWcw+UiyFceMO3Bhc9RRCN/ckPjei7y/ASaQU=;
        b=KYejWMapokN60lwVF7fxteOEye599ef6/OxWctoRS8GVcA76Sw6govUpNa8ytbPNs6
         p1CzqgPHfMyypH0qNndZeEQOIUmgN9ALISTOrqlm2lpeLujDfHzMFiRsD6VYQsh8+7rh
         E6Jdj/p3Q7cPWp2Cw32lT+lKIHrM2FkARxjKSN+0UbmnsQg9pTnIG9C8p662PwEZswp+
         XQa8kH943iZ5eWS+3wlCrkQxPHdwrFCG7lconWlTHqSB/eD+MB1iKvQJCXWlG3sUYdyU
         2GC6dsnVuuDtw5kGj3PQ7/UB0PdsZl7/5k7i8wvAZpASiw0R+kYzo3ra2W7bX+0GmBX4
         n8eQ==
X-Forwarded-Encrypted: i=1; AL+hErHxKtD0WJi6BHODocni61fkxG5k4Kqi+1eG1mCMwqaosx8YJZxzgioOszoV7Kuu30GeNgLiSqO3WRwkzNh59FmzEQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dROsLdpW+LxO874A0VwB+RQyITn+BclUGHdB7ChdHVsg6gJWL
	EHpLToHq+wnlv60+oeEpHmnWeTU0hJOYXX3/XEWx5sDkk9SSZPLVBjoD4NMLaxR7mRxOR0bDctu
	11UZB+2nzNGRang3e3a3TiHIoTivPA6Y=
X-Gm-Gg: AZFdTZfM5FCX4I25kfDT11iT77YOWz26RWUPtsgzCGK6FbTqnm53xGIdZfnhk+vfVyw
	ZsGvOx1kvvpsOrqFgP8CxsREi75cUnBGe3BrH1o3K77yUs/FCSHltnju3REYzUWirAlYNirlmtH
	WIaVE58V8agvrybxUNax+9pVWtV/SXdcETaMjjRmdqAmLoVk+nw0bgYts49nwmK6Tzf1CQfJqeh
	Ii/ODLx4tW3sBL+ZNGSHnbxPORY9ypXldSEe16F9lpdv9ahIQ1G8IzAyIXJJB3opBFa/L8jMsSX
	4eetJ2T/QBKfWOsLZXJAkQel1JsqwdxHWZlk9PfSxn08xZILRaithb2oYaJryf6dRbHo1xgtOgU
	2V5xoMLcg/6497Bpo1fFx49UdlVwr9o+YFH06esUmmBNm6OPfOoFKBty5JUyMJhnx/6UsUxYYFR
	k+ypFSjWhPPwBqHLxsBqv4sq2HumrFBhGXuVpmuDmdjXFq0EZKfJLstW5DkPk=
X-Received: by 2002:a05:6000:491b:b0:490:9fe2:6a2d with SMTP id
 ffacd0b85a97d-4abb0a710c2mr21603138f8f.26.1795439799381; Mon, 23 Nov 2026
 05:16:39 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179543956483.3294.440601604363377666@kernel.org>
In-Reply-To: <179543956483.3294.440601604363377666@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 23 Nov 2026 13:16:13 +0000
X-Gm-Features: Aa3M54p5cXU3HarfB_L72M8wVmAoaF4EoHmiSiEqy9m_atJHStDac1KvUFiv0V0
Message-ID: <CA+V-a8v9Rg1RiM9e3gM69EpS0uw1i2j+J67+f1T+J51WoKQWCg@mail.gmail.com>
Subject: Re: [PATCH net v6 0/4] net: dsa: Fix various issues in rzn1-a5psw driver
To: netdev-bot+sinfo@kernel.org
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Florian Fainelli <f.fainelli@gmail.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:12=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
The issues were found while manually comparing the hardware manuals
for RZ/N1 and RZ/T2H SoCs.

Cheers,
Prabhakar
