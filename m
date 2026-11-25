Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618374;
	b=350Mh9ixP6xLMxN26Yx6P9uGd9rLtFA1iRXIG3u95YXCA+PpV9CnQGi9eEppWI7dlkk4
	 foHavdhoz+E3K6MTmUXXhb5+YB/taJzvRX4CpUATPWIsxMxsMIGT0E69QNZMyCqPFOA6z
	 H+HIybYiQoH1HiBayUaSAkSBFADijMOVPrwj3ZuAYL8NTwYDuHNCp1ELVAPghl0o3A/EJ
	 EXHmKB+fl3AiaogMuI5GLcMXzPigpMFaPxIVaiRUwRs+nZQN15tx+Rq9s3QslOt5ZSUop
	 0TmBhzhgXJrkmVA7sP1z3NR474jMjBVGT+OZLDDW+dRGveXWNeCGvF76fG9iSvynnCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618374;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hlkk4xXsXyEvb1D9H1K80LoXoGwa5zP1sGDEDxlcUog=;
	b=CXLOVVWFJzeCkEp0XkKTdBArf5f3zEKTcRIwZsekkoRnMrj9LJi+X22DGRSCXO0+p6Vs
	 0valt7gtyeC+9PmRD6JYh5lbeO5aS5KHhgWORaSg3Lv3cksiJar8GBat04KR6aiu3PE9c
	 +SfIRRWekkALMT2kKvzLTXpr94oHCkNJlwLm0hnIS/2mPE0G4m3HG2KudCd93rTtK2qtW
	 nvdf8dwEnKslJ7v3BC5Ert9aDSWqiiqn19K6gH4Mjw74c1FJC6+wYWFWwmEih8TtMw3+n
	 J39s3GKicWxP19oELW2FUT+UPituAFI91bRwz06dwXtHdxY0RaE5KaKZjQBNIFn91Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB776606A323
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB776606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67daffde88dso3457789d50.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618373; x=1796223173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlkk4xXsXyEvb1D9H1K80LoXoGwa5zP1sGDEDxlcUog=;
        b=f9qZebzk0zPVieGctVAuTLS0IUw1o/V2+SYHz1UYYmeVTvD5FR9NzGLrSIdE/c8Mcn
         IameiQiOrW/dduVG8EiJ9HdGuTdhRUBFJQ6u3+E/fhv4Btro732qn8/qOLG818+UX5RS
         eTvZaSt9ELF6swgcNqthp7Gt+nK+w1qS5YgLSMrntnRUYcsyApVcIv+zTaZI/lj0uF94
         1qDO9Nvy8lSAoIUGK3BLmRoiCLcX/WnIXo01jvJvC8KJv5MOate8l6y6a2L4sTediCgf
         /hjqXr8Uw4lQh5Jt1ICDVevJi1EGgUbkBObL5OMZidjjtbczZ306EZCUe1aPv6vpImO2
         IGqg==
X-Forwarded-Encrypted: i=1; AL+hErGfeEMDIAl/dxGCr32BxkpPI08yOsNlhm2BC412cHNqjcUYVcJDJNQojZ+TaXviuneSNgv1Ck1QssE8fRt7WXzRmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/FH1l9315Z+YuGhphAIyDHg6uXcXRconTA78ajr5zx4xCcajFi
	Ot5kh+2RaHoD7j0+4mLAAJDNc7M2hqX9UuYtltSZLU90WgiaxgGgnA4xAxt8tDR5
X-Gm-Gg: AZFdTZcfj2/D9BuVbEfWKflDx0RrJAYcVt4LQ8d8fvSg2E0NXC8vgwh72pMk1KjeQFG
	i3cHkVYAaANU2/xCuiWzpR/pSu5sZtt1DVg9EGoNMX96eDV7hfOdqWfj2n/9wzEhqRA6DrO9eiv
	qXwqLXc913TSMLAUpY7C8XGvobDjR2ViXX/RgvtBUc02Vi3ScGxlxet3FwTfCHjmoZZLBIsOrls
	vRt6YVpZYweHM0a9DcajAH71rJk+zKPBVB0ExBifcYW7eZpO7XmXCEkILtAA+foxOoLOQ3OS4w5
	j3Jw334bIYMSmcOtNA+7x9zR6qWXFh8Bels+7trTzlEyXthKGWqxlDv8iPbDkPot8HMJSdHagaP
	15gWlQmc4/Fdf3ULHes54Mw3FYPROyl/zfks0hD4ppB3skvY7vGnd84qnTPN72Cd7yRbjuVIuWd
	+ADJsGqWwTD/E6gCxLQ3rPp8NqiCwt5a8BM1vIxGHcupCqXb9B5xDzwoi7x4Y1ar0HAYCW8Lelo
	NaUxdGBMfMpTeUch72c8WfnYGK2EF1e4IW/ZARZg+RErNHNGnw8V1+DhCwzB1+Tv6SV4XSEpqSN
	wo4LOCyQTQ26IBF/M+iuKbPPVljW92v3FW8cJZfUUaIHof4uKKAY0nw5Jt4RY2yV1EFY9b8=
X-Received: by 2002:a05:690e:4501:20b0:67d:a224:6beb with SMTP id 956f58d0204a3-67df4454dbbmr3980366d50.61.1795618372718;
        Wed, 25 Nov 2026 06:52:52 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b8352sm8429089d50.21.2026.11.25.06.52.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:52:52 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ec690faf85so2043150e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:52:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEblcoQ8SuVxk/a1hi6GdZtZ2XwapXU97Kp22pzEMdqzwD5xrxIt28LA9PnHgmtDkobgk+E3C/LuQZ3pBzCMUU18Q==@vger.kernel.org
X-Received: by 2002:a05:6122:1784:b0:5dc:d0cb:7d74 with SMTP id
 71dfb90a1353d-5ee8adf3de4mr9944668e0c.2.1795618371669; Wed, 25 Nov 2026
 06:52:51 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com> <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato> <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
In-Reply-To: <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:52:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX71k95powpC9qNiKdN=wRCYyYbvOT=EYmExE_2W8u3GQ@mail.gmail.com>
X-Gm-Features: Aa3M54re5ZNPOW-XITDy6yDteWVZ0ZL2EVGMi9yHMlXJRb9PY-Nvu_jZHjCd6J4
Message-ID: <CAMuHMdX71k95powpC9qNiKdN=wRCYyYbvOT=EYmExE_2W8u3GQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Fri, 20 Nov 2026 at 15:33, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> On 11/20/26 12:10 PM, Wolfram Sang wrote:
> > Yes, this means the driver is then tied to a specific firmware version
> > because it only has this mapping. Not nice for a user. But we didn't se=
e
> > another way moving things forward for now.
>
> I think the DT is that other way.
> With the SCMI ids in DT, only the DT is tied to a firmware version, not t=
he drivers.

This only focuses on the IDs, not on different abstractions offered by
SCMI.

The latter leads to the need for changes in (many) DT bindings and
drivers, to support the same hardware blocks that are already supported
without SCMI in the same and/or older SoCs.  How many different DT
binding variants, with corresponding more complex handling in drivers,
are you willing to support for the same hardware block?
The remapping driver takes care of this in a single place, avoiding DT
binding and driver changes all over the tree.

> If a release that changes ids is already out, it needs a new DT, or a qui=
rk for that one release when the DT cannot be updated.
>
> The hardware stays described

SCMI IDs are not hardware description.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
