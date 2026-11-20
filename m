Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795185841;
	b=cDxsaFBFgoPGsWpiQbdUoptK0JUSidENoXl0mrjBYWXTXiJzhjt1T3Ez3e8XPkWUK/UR
	 2vO2Bx17F6F1pn0V4Ussids6kyNr1jlEG++rIiVfPX9IgvvGtAIXuqIZKWemZhPc155OM
	 TZWjxHrTR8PmLLTSVFUOalKFcO+86nwLiuZe7Jpc6DZ7u7SGwlevWsOpE4SKzeUjDDqr9
	 8W+6OQ4Kn6NwH4toeBPgDygPrWtCgFbh+Fs5mdQJpjKR9nMcp0MFrdih49QfedC5YgJan
	 yNt6/iktesD+/4iL0nOrUSy9J+a4bRFk26Hgmci2sDWKbo/g/eCwJBH3gE85798PnXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
	b=nc0WPFCCQ0kNtp7/7jzSOX+7cfOi2t6xEmN0AFOimYnvp34j9oK/+F04d3mXK6LkUSYQ
	 zY6lURXjVsaHQKkpwewhFiQUJcP5IvieSJrlZCqbAkebrq9p4i0E6tdU93y1+a6zyxilA
	 7TbMfMlHCqnxUHuHs/VVrcgQQZDCdncAG2q8byKA8/oHdbU1rhEi4+tLDwNuoZ1Qf4E5U
	 ry2HX6D5qQS5M7PfofWvJrmbhliEEszhWceDhfjjtYSi59YpRUQ54FyxIUm5uHfmS5QPj
	 EraNVCQwbmCAFDfzm27JvbGcfqB0PVm4agyBiRjXRp3bh9Gs5XFgpGeJBWXFHKL9zHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYQ5tBef;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4781E606A320
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 14:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4781E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYQ5tBef
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb606491faso5194295e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 06:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795185840; cv=none;
        d=google.com; s=arc-20260327;
        b=SCzNplr5lBZVd1Qf0jia8/rjrvm71hCsIdQVaQGNM7AskedjVNGZs8RkQFdCcOdniT
         SnOUGsKJy8lYPAUBzJ5WG6JCfaN4GnnMbIZR4W9Q5Wp1t2W1SnPIZQc3zQTONVHhKhjF
         qHN6lT0NBrleqsJ9YK7Otg/wZ6lVm2J2AYaMLEUVUMYuVfCNEeeks3jDKza9Y+YKuklx
         6As0l6YBBsmBbjbHCWq56P3UxY7vlM+Vpq7/KjLBl7iEmvj21xeEXXspCod0o63OcFLr
         b9V9rdtQXD4x2PrH1N4sxa8eRNjI1FiZxwQ+cMpRj5hpeQio9U83JC6/fxV14Wsl3OkX
         GSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
        fh=NfP5hru3Y49UhICUoVTKnHSqGkyozJG54DWUH5xvdUE=;
        b=L+JXL+Jm9Ke0PAEMQAMup2MibMfz2w7StfGGyQRMKTtZSKthJgJAGYlTtCsx8js6gA
         tIQxabWnIU2RYV9tUkxDlqOVbbQy+I/3VYj1h8IWpfjlQtecYLstnwrglUClwz0hYiVz
         Oi0XCT/almm7c/3wc8GgUbgnQlr1kHe9RtEx1X0xaNtrs2i7acDkJGWFAPxKpj/pNwVA
         j99BRz8NJCm1wM9qil7jnSyrmV5L+96vP86NWlOKe1QTB8xuFY8MoLLeXEu6Ohwg2RZt
         +wTByvvh9qNbV4Wo+0vAvbQBsMKaLIkhBDVi8rDfHkaeOVrINitRz0iT8aErrBpLYW0H
         4ELg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185840; x=1795790640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
        b=QYQ5tBefbybLAahWX1T5jVNJjZMBPRgTJcbKw9SACiCbwwSstGz9QZ6ob5fsto/bXE
         +VmKIKxLJ/kCzeAH+ZPIBRboifpiXTNqwlsZ1wHrk/YUtr8sINXI8KJ6H09oUVftbhTn
         3kCHtT+5pz1P92H0uCuSAWGowRv4dYGficTGkvLioFE7xDeWNMAL1pveel1tNwqpB3hG
         3PZ83BtYlHO4v3/+OKTiFFPAwQTZt9IqSUQ4gslXE37h2Ua9/EcuyE2thspfPFV05n4v
         CXKA37NNEfw09vb/vw8SVg3kWl1qpPvnNrZA3m183s6nJWG6iPrIwCbkHM3cH0MtpDs3
         abLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185840; x=1795790640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
        b=U/jE4uVcyRQYMb6UDxRlokg0wSeZqpbEEyFOg1vFFYtGzEVL22+jt27Tm2LLgen0Pw
         6U3SKvrvt99/HtEMQIdYE27nrHmq+0iAm9vYIu8Yuhe12PzLjP62iba48kOFJj6qHS96
         vsJMtT/lV2kLgWQ3YSNwVeqP+M8FsdanxMYF+ysJcblL+4P5P0x8kJbpo9zD2kiQkj0Y
         L76+HRZNjqcBpSkQ2gmn6exqE6ugRYIWkHjA7ZJE1dYOvAQ0j2kLOGZKDbVXABI5TcNU
         guMdOmjR7EGHTfVRCL42rjHcbhn5qg9o0JUQ7rsTsxAdG1/Llunl/ci/PPG2VFmYx2gr
         Ai0A==
X-Forwarded-Encrypted: i=1; AL+hErFEkyvF9I8NkFk3/h6bbaGAOeoWlWr+zOtCZEposuqXaJ46tfrGVo76hUcVeLI+OKcU/JeMeXTC1xfn89H6Y1D+Eg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HM8kW4aasvc1ELKUnmHDMuFMXcrBuk6fnGx1gGNTe81clqKCO
	Tkh6reJgbYWSSxslW0G8pffvy7An8vTAafo7gLtbohUCtCwAHNtbIyKygmACAYYI19jHY9CO8tZ
	iatFB6PMhMrfWB3H+lTlXuKuwkwO2OEQ=
X-Gm-Gg: AYBFou1YBnCp6igaspY4eqZkmRXrUJR7xju32CXXlc7rxUxeA7WPyMAwFq8z9/3EhCQ
	cg1WKtQ6yTRDmBPJgGwk6l6snESlp7D+DAatUBW6Tcb8fi7a174lFYlFfKCOssuvwQcCudJeyRT
	xQFLZRmqzfBB8j52YTbMyedyJi+saTqkXNTFFBBoTePLwOsq1kpT54OihKcDclw3Rhx6esVJY+f
	sE1NZ909O+3eOtFRENGsX4LHW8xkj630QL0DvegspCoeaQLeQiEydQErVFi1HpEmYKaPAD64joX
	e/mu/NzwjCPQoPXf1gGJ/LIqLiLArlSpGptDp5bIFMhHxBU3NZ4lt+I7VPV2bh0iLiL66uykZ0K
	sarFnsKFNhWjtjPdY8qb7nn88Tk7WSsHKMkT568S7RlKVMQ1XSMefC9mbUlXd0lmKbztXNnZ+mc
	xSb5A4WJoZ6uq8vSej07S7DPJPPUUQk7pFYY7lCL0MVzTO1DdNivqjNJq0J+C7uq17gj4wGRenr
	K8GHbLynIfHV+dMNLKH
X-Received: by 2002:a05:600c:a088:b0:4bb:6473:cde9 with SMTP id
 5b1f17b1804b1-4bb8880f2d8mr64314205e9.6.1795185839556; Fri, 20 Nov 2026
 06:43:59 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179513453453.3291.8493509332739817258@kernel.org>
In-Reply-To: <179513453453.3291.8493509332739817258@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 14:43:32 +0000
X-Gm-Features: Aa3M54p4ZaVOj21rOraLFop2-l4thT3tsd33lr6hbx18b-7slzJ7KmqEF1KOtNk
Message-ID: <CA+V-a8vCCZy6TSDt8aSDA74GxbdFBP11DCmKB7+T_6+TU08mhA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/24] Add ETHSW support for Renesas RZ/T2H
 and RZ/N2H SoCs
To: netdev-bot+sinfo@kernel.org
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 20, 2026 at 12:28=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
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
The issues were found while manually comparing the hardware manuals
for RZ/N1 and RZ/T2H SoCs.

Cheers,
Prabhakar

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
