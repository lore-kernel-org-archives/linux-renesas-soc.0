Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308944;
	b=SmFH6fIwVKTC3G1inYnpCbzDr7yr3nVJzJd966dyILV2/Bp7gDzh2NzkSFBJ8usFGkTn
	 hTgM5DUEjU4H0HRIB6oTmeVK7qrB1P0M0PD3UO0eOup8HfsAIHTPKEmimMSNj2pQ2pMjZ
	 54oja9O79+cV2q6kHmB4YHVhqL7CnM5mSmq2cxyCJMnDPDrd5QUeK8XsQCKcqC/gY6Eoy
	 hi0wijosl0HrvmK+evYscS/IY121gMgK3RQi2rdOo8m506KPNS8Tvk9hyNW/bjvJ11VbC
	 tWRxQgqaUV+oPxJ96zQNH+kkMXG43OxeTH24R0o4gatvTjUYfdA0gAi4ulmpPn7Jv7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308944;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=auzMHF9mizeGPb4pIAKNV1dcFrP9ke4ZkvXnr9sGJcA=;
	b=tr/cRElJ5mgyC80RsQDxv9kMy5TU1uWmplaSLWeKr9yKuiJDPwajt3EiX9PadCOFMRIZ
	 E+amLprEJBDtbUwdHO8nK2woplscuXk7aRWbeNJK4SnqF9VhMzfbjepKA+5NRW5uXrlWq
	 6cOKZ96axl+1mMdDMcAE0HWdQqKJIN1PqJkJOeSq8N5gQ70UCkZbhDKgaKs4PesM85o3b
	 FpthVgemaOBLum0l+6V80Ir5aSZVXyQ/WJKbHdgd29W6XkxFK4BWR2VhJWsQXU5IKyvyS
	 F5FwlpSxu2emkDbknFgGcyjazrJW9sywKbym9KRCsSPv+d9Kq7ABJYYdD3f12aeRpXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DE5606A326
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 11:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DE5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d2ca055399so601993137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 03:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308943; x=1794913743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=auzMHF9mizeGPb4pIAKNV1dcFrP9ke4ZkvXnr9sGJcA=;
        b=PPadWlVqYFMQDJvTIz12EY0QeyN1TAz1lDsmgM8v7fVQfQ8w7w9DhTfCctHYsp21of
         hop355wGICSTTwPRYJDA5EMaX9MuXocmQ5MZ4OLM6EopO91I/d351gs2P0P+xEdejwNv
         /BjjK82b+ylhJIJYnUQLrmJ7m1J1I9KDwzPGuAWAJLBKvW5lkxLkgN/qhtk5XpcDvwDl
         bKla+kY7iCZovK7BodW7PHPY90jROINeE+ZVvfvNpjAyriZ6rR1Yc2WU0e2s8aAIf3OS
         QJW6gGVi0sufApdAKKN/EIjWmiYKrgacU12vPBdfkGQq8AMyXHPWH3frUq0KG5mFka9+
         LK6g==
X-Forwarded-Encrypted: i=1; AL+hErG6bXsT9+rQKS2fNhoXYc6L7GIXZ5fyV9vLfn2OwkunFHJZq23vM/HHE21jrJA6hUT0zvir+c2RKmipRstQM8nFGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vhl14yvrr2496s2mqACeWU67Vn4SS7G3tJpxBwhXZqzNfVYd3
	e/uLwS5CXoEwla1Vixc4MFLIMbwT9vjfLrqP4yZU/uELODZrvjdDYkxvD3p4G9xxqRs=
X-Gm-Gg: AYBFou39JwBVjHgK1JhyQeccelcPeETnUJ/eeSGBrEvLC9v9UaryQ0gHVk/a9c21inX
	SYbt1z1rQbpSO/8AXWoh8zt5HieCgr5FWArvQTftBQFgPeslLFMRAVrJr1xAqfvJCxNG9VCzaPt
	hM6ni2L2yW6B568oDT+l5JL7h7vPA/ZNfXdGuxnjn7JFVyTyJ8YBZHrc7XlD1P97DNwtaW/n0BT
	RbcgawUIYkbYUHGySumL35uoKvvvr31GJ9kyuyMuoRIJdbzMjfFFAkrj4iLzUrnUgaEBi09wjod
	DF/LT7TIjq5yYOdBIunZLyGE5+H2bgeMWjVn5TnCB6Mx84RIiYBhrjT+houCGL0uDUbcc6m5QeE
	xb5+HnvwrQClZYVEUZk8R+G/QrY4izodtQQB8lygkQHhEkpk13wu1Ex0cRUxRJXn4VIxSHr49Jr
	JnIgwapI0TBhuhE00I1DCZzfHKcBzs+ZGZnXScOhNjX6GqyBFSzVGYTjq+4CzSPrs9wjiDKkP7A
	/0ihmtOWFtH7uAtlPnW6tJNHdVSvjC2bdtjjK1Fb0j1MlIzcZQLFTjQRs0HNHRug/RVu9ZNo6rB
	x4NCJFqka0YK8GiHBKgsEqSSWdWIXwnn6fUC2OUygNeoj7pkSrC5daSQiTIThQdf9NA=
X-Received: by 2002:a67:e104:0:b0:7d2:75bf:2fdb with SMTP id ada2fe7eead31-7d301ac29c4mr496190137.2.1794308943269;
        Tue, 10 Nov 2026 03:09:03 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fec26fcsm1584074241.2.2026.11.10.03.09.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:09:01 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7cc81984fceso673985137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 03:09:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFvMCl+GTUsq9yFqG2krvzvdWuwhiiyFDxOil7s0sPDOGLIs9M6tuiArZtzFpw8yxdI9yP2YUoXkCdA5BmSzl+jsA==@vger.kernel.org
X-Received: by 2002:a05:6102:688e:b0:7d2:d65f:b479 with SMTP id
 ada2fe7eead31-7d301c226cfmr561698137.28.1794308940907; Tue, 10 Nov 2026
 03:09:00 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev> <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
In-Reply-To: <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 12:08:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com>
X-Gm-Features: AclHuK8XmPD0hM0Yy0td_5BzKaCizARWIEsuGHtnTdehhY19YbtXTFG2NJSt-Nk
Message-ID: <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Tue, 29 Sept 2026 at 16:19, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> On 02.09.2026 17:15:37, Claudiu Beznea wrote:
> > Series adds CAN support for the Renesas RZ/G3S SoC. Along with it a typo
> > fix patch was added on the CAN driver.
> >
> > Merge strategy:
> > - patches 1-5/7 should go though the CAN tree
>
> Applied 1...5 to the linux-can-next tree.

Thanks, but six weeks later they are still not visible?
Same for " [PATCH] dt-bindings: can: renesas,rcar-canfd: Restrict
resets in top-level"
https://lore.kernel.org/20261009-holistic-warping-puffin-3b92fe-mkl@pengutronix.de

Am I looking at the wrong tree?
Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
