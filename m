Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172429;
	b=rCE4tP1Mjr07gVyF2nKBCkb5AfJ7xfhVIlzh1gJl2v8q7naPeupVJ5qVT1AWWcX8pwne
	 4SgIHeSIk/kHaDPTuEtzSxHK/yqi1CQWAe3p9nlouPQv4zPXUgPz5xsQRw5zmWc6gzyOx
	 sAMlAn/JWku9QV+hsxZMB5cK50qycA8cQlt7QboATn09kfbhqUe2Xbuto5r91Fj5VFbc3
	 tQer+BEPMkZXq7rkYPkD9Dk/TrVixP3LUppwMA5MpyIzSuwU642QDgpXDmpI1liwPnui0
	 nm/c7Bz5INhySoyBfeDCo2gb6xSsbEnWT8p7ip81rku54pPYj/e+L2/W+aHc4qCMEhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172429;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LIOr8EpDe3/dYmsJbUDbEQoYb1h/0cU5uZHFxnrpj+U=;
	b=pGtBxYj3AWU6eq4EUbq8CQ2AaUiwjBfbBkizyW4HVapDD0iDhMSpVBCV7ed+ECclvgDE
	 78UIGyweEH1FV97NWQDEzislRrCDBJ0N/45qrG5zrygRvxMK75s7288COJcjQvLmw+2CY
	 UBfXjbv6r3v8BN38pHT9zip34lhFfqgc69fNTYe4qMTIaq8keR8rdHaRJHc5VJmQeZbcH
	 93+iB/XUn19EcApw8HyDIZOMtFr+dMU/LvpPEdX0kfrUQmf2I4/D6zJq85u4G1+TWjr9g
	 9UGxuSWkfr0zj7xhtoM6TacEQy9SA7Ba/llZ8WKdSqYyBTgDu7VAOWSPBucu0oyKU7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF4D606A326
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 11:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFF4D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74ab99038afso490792137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 03:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172428; x=1795777228;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LIOr8EpDe3/dYmsJbUDbEQoYb1h/0cU5uZHFxnrpj+U=;
        b=KouYnNjNoe54fL755BAxJ3XURtaHiFPrWT26xzh7oMuU3hZMCp1pHgcGpsOpgNI+c/
         IeQs2JjZGihjDOOMUI1R4hu1rBGwhlHqT6L6skTPmpOlx9q5fCO+sa7OfIhNbzYqYEcZ
         5OMvOgelo0rFbZzjspiwYtKuD63T7hst65XM4Jf9jZ91G0BvdQksXKT0uQazVMoHWAkU
         d+hjwiJ/fS2edhPAO2KNiXwuLmDoE4E0tzJ1bEI1WRwgdaYcbPJjO6YPbDR06r0/1Hm8
         wsN5OsaCZ7UapFLyyYyq/jSO1GHhSp9mmBzRJEfMRogV06hJsUyFu9gI9T9616M1zknV
         G50w==
X-Forwarded-Encrypted: i=1; AL+hErGPbHK+nHOmYI7inGPWxvsMWMBcB+Gb2UcVtqCVjopTYKiRRWOOpLZWJxB4U5NTrc3UxKK8+qeQ3ytTI9O65IskJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZXMgp0Tdg0Tz0hvoqX7rJeuuJY/epdBN31BgkPzSlHbznWCYr
	pJOZzsI/QSVv1IifMMPva4XLCYVN8HQmoH7j7Szj6UwLuPpDpEdRcOJCkucHhskH
X-Gm-Gg: AZFdTZe3nXIH10z0FQVCZsdAJLxPEOkS01xk76VrtLuxUC+AbMPq04SLJnSduF/5InA
	Ami3yfs174HpWe0xG/X1tD4Pk1ElrhVkCsj29xVSTLoNrLEhWPTZe4dDdsdHhPNmdW7ktSLcEUA
	CEiHgka9OIQhjZQ7aHG4pgoAB6FDrTUinzhj9LvDgha/xKx26aidTf/t4iga+4t5OnzOzjf7JEJ
	5/L17UetHuHBTc+nlmihSsHN0sKhdIhjbephCYrGb4l7gWnYoPHRjYcCyU5G/gbx6lPvdcFOyzR
	QMlKnGW9BxyFU5yr3G94AoNwb9KQD8VEO0N/kF+0WED8bPPI2MaW/lv2kNwHqq+vibBh/D5z88i
	Vc0aBbA2NGDifqrF89xs5ixDzIgyOFNgtIjilzPUqPXNOVctnPPRDDco63QKjhrgtdRow5a5LTp
	QNwIMPlAT/yEf0x1QYvjPLpZ3EmGy54TqIwfqZfASjTUpbbsCgPbXDCHHESBFpOGLWtfdIr0w8I
	wsVG9W2Q1nHjLKNhllUAAnuDE6SnuH2WYF6WTP149JnqCnjgBGjHae8eF+ERDUxAXBzAmKjYXw7
	7Q53xA3nKZBHgCxWzYYw/cJ7OX9d7Jv0l0uvjQu9LzeZEKcdOnYy6cOzV7vfFZ9EeJQ=
X-Received: by 2002:a05:6102:b11:b0:7d6:3d9a:4da2 with SMTP id ada2fe7eead31-7d7396157aemr1194410137.26.1795172427495;
        Fri, 20 Nov 2026 03:00:27 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7b12eb7sm2659254137.0.2026.11.20.03.00.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:00:26 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99e1408dc59so369872241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 03:00:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErESAMz20vVERoJwsruXmTK11UE4I76S9mUTNwCASJTbjCQ7DlaAaRdK1uLiPkYMcd3eHtQV5Sf2LCrTUrnI4HvGpQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6047:b0:7a1:f7d2:e82a with SMTP id
 ada2fe7eead31-7d7396a6eb9mr826644137.35.1795172426626; Fri, 20 Nov 2026
 03:00:26 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com> <20261116-canfd_rzg3l-v2-1-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-1-89e06c46f40b@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:00:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWBB=tMDtssy-8r4=v_u=Pid51gFC1LOgzP3vbJQg5HHQ@mail.gmail.com>
X-Gm-Features: Aa3M54ok0nFqWrmNFE92MZcAAo9DF0uGdtmbDc1Y1AOqliGu_4a_ac6uIR0TZqI
Message-ID: <CAMuHMdWBB=tMDtssy-8r4=v_u=Pid51gFC1LOgzP3vbJQg5HHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046: Add CANFD node
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 16:33, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the CANFD placeholder with the full node description:
> interrupts, clocks (fck, ram_clk, can_clk), resets, power-domain,
> and three disabled channel sub-nodes.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped fallback compatible based on bindings.
>  * Retained the tag as the change is trivial.

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
