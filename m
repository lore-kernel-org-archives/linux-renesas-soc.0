Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799097;
	b=ce1mfhFIqv/Tq4Af7Ogocpjf6waKim8CK7ghcfIz9+Z2pXlhB+K/5QIsJ1NUjw1bDZqs
	 IkxBHdFoE7nFLXxMc1i3jFlGdgTrgiiSeoSSkgamueG502fCFKi8d8e09Y+O5snY9fx9B
	 vIM+PyKlGbUrGlm0fIpoMPmPh30eckFdbLM81tCS07zMnNIZi9nqOmTt0E5z09Fu5YKqn
	 ++tMuldny+89qKrIcAnCXZVbPYs0M3adDLEPrEGx/KhTL0xcr2espp6/DMerisoy25+Vi
	 cVDzp+bgnH3PE5PX6GlleboN4/7tZ0RThjlmPgb/xpH/V5Uig9lH15WljntPh8kQ7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799097;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=+5GQvxlGfiedD5Vq6MiM1mQYT262DR/iV50xDACh4A8=;
	b=S2ovWfzCBeghBUug1isF8x831rcVOMy1rrT6xFAi2BUEI42fIVHKVFVQrpvL+aydJof/
	 KEM8AmBxHsgUb3+vaKZCPxVXzj6pQBQCfzug4nv0ZHZ7fyuQP52Yb83H1ODZugOAsBam4
	 0g/eyzb8LQY0OGBaOUZfYbmfHhFS/zwK7HCa4MG7EQoAa428WB3da0YNF9vEZy6IujUG/
	 tk3eHV3/464luaf2pVYJBKnV0QeXEO6PZi9WNm9ZMRl+hCkdHtz+apRxcZ1LImZJzvnc8
	 xIGitipGCpZtXVnIUQadQVPH5p0MwHdouuwcmXlk/IrP96HDDIEz/IyJqaELCYfncCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90491606A31B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 13:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90491606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c418e215671so102011566b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 05:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799095; x=1794403895;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5GQvxlGfiedD5Vq6MiM1mQYT262DR/iV50xDACh4A8=;
        b=YbBVe4wpqlLinWAFhqh+xBHm8rNFJpHGwMBxqMIvpMOgxo++PfZZV8xayYKPIwv5m9
         97ACjgcTh1XcgyCHQ7LLZvtoudb5sNFPnwaseLj3STH9AFt1mSb8mmda5Eq7n6qCTbaZ
         VJbUjJrwZi/mjbsk4gG0cnSfSQi4PLO5YprwRPe/m26QLjNced7yxNAEDxwUghDZWi1r
         YU8JssnaL3oYQZ7d5ELWy5CzlpXir9Y1GLqrq4U+85R1gdN9ZO0XtRggQWCfB/5p49wf
         VKf7nkMCXxGZ35J1g+MwJGohHcFyb54KcWBva1a0GyI9KuSMB4ByiUrE3zc2eyvT/Zpa
         aBdg==
X-Gm-Message-State: APuU4Z8mU+580y5CqBCkzgSOH/VNPXDsO2UJ7HF7jGMxMTAeoTD0+jKy
	QPkjcNJEVzR2KMUOZwZ9kY9YFruuxynt4QjuXhIbPNcI6CNNCadqcL4zPfHrQb5E7ZA=
X-Gm-Gg: AYBFou3jVE3k122dt7hywWZDWcHkymogK+AyobsVwsAIWzechngFZ4yScAhLhogtIL8
	qwa0UITcctwZ//n7Xps/knn/UHJZxRZn7zOA1oVkntQCtfIk600OgL427K8XjgAkNvHk+IDt532
	Asc4f+CeH1fter3+HxCaGR8kSXC8oiMMOk9yQuxZ9G0Ed2KIHMf+6PHiPiWqQaW0MYctgRaoLg6
	Ax+aE2JRjZs89FaHUEJcfgdIPlAmlhDp2J3iOJMwdogMfWA+6HVVaqalrsyZ22CoPBnzBhNuRn7
	nwymfd7WRAGSzGnULfRS44O2mKIODjgyAaRwxKwD4+kyBceVQlK/e+M0wXFBXuTQlw5tOQ720qc
	PVVDBkIPVII0PF/rGvZcxc6P8xLp+yi3BUAXu72qEyKrd7haBR8n+Wyr1fxORw8zuELjVIMZZbp
	Q9bd9svLMjeaf7Y3r1LQZjfUiQX2fwOxKUtrsBViXM/oC3inKWF9xZO2RrIX4aLk5yGGAzm0gRC
	YiBpgDYHHB5hNARWJuX11Uxzke1wxECmEsIZu2gtpvzomm5sB/Z2vj/Er1GmVzXjr0U1UsrkhTO
	ebm81lvqZPa7M0GizkWRB0KlcaRk65uEYBLJ0BVxXX2KQKKTHTG65h2+Y5/SVoPy4Q==
X-Received: by 2002:a17:907:84b:b0:c49:8f1e:af0a with SMTP id a640c23a62f3a-c4ca795e453mr1375236966b.7.1793799094706;
        Wed, 04 Nov 2026 05:31:34 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e424f94sm71115366b.24.2026.11.04.05.31.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:31:34 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so366416a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 05:31:34 -0800 (PST)
X-Received: by 2002:a05:6402:1f89:b0:6b5:47ea:ca2e with SMTP id
 4fb4d7f45d1cf-6b547eacb93mr4089361a12.11.1793799093761; Wed, 04 Nov 2026
 05:31:33 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
 <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
 <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
 <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
 <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
 <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
 <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
 <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com>
 <CAMuHMdXbJvFC9n=LTW=fXhGBRgrDzQG2LUDTbZZruyovU5OsQw@mail.gmail.com>
 <CAMuHMdXPg6dBhvdgKwKVVDHP+7qJDKTfRzKGhXkUTb=gX833Ag@mail.gmail.com>
 <CAMuHMdVJ2joZgT6Yp4VhXs3yr4ntgHSyCt0JiyWHXueN-3pNFA@mail.gmail.com>
 <CAMuHMdUS=MTCYxgCzWT1K6NX-BzxxKpBm_Q85GbCGTN3ppUhYQ@mail.gmail.com>
 <CAMuHMdW2d+kh=J2GUeL2f16DUM5ExBD4eva34tHSq-JH38RM+A@mail.gmail.com>
 <CAMuHMdWBc002vKmUsTpDpxZPU+Z8J2=NM1hYXWj-z26oV3gxwg@mail.gmail.com>
 <CAMuHMdVCcjNwnS+1cJ-EAhr9vdwZx2F97ta-nwrMEgqptboAvg@mail.gmail.com>
 <CAMuHMdUQv9i1ZUhzZV+YhhmjbO-f-0n9ocfBYAiVYP6We5Evpw@mail.gmail.com>
 <CAMuHMdUrk5GzMWqbYa7PnrQf157TCnS1xjyiV267EakcL+bCLQ@mail.gmail.com>
 <CAMuHMdWM_Q-Tk++nt2ZhwpzZmo=M3fv0fzPr59jAv6q=ec=vtQ@mail.gmail.com>
 <CAMuHMdX-QTWTukQbLn+pYgmzZBu0b4OtM_oTGhS5_SMMtazhEw@mail.gmail.com> <CAMuHMdXvTc8LEQNH06MQ7tDB9RDoLRnVRh=AqOqY2J7qfN9Qjw@mail.gmail.com>
In-Reply-To: <CAMuHMdXvTc8LEQNH06MQ7tDB9RDoLRnVRh=AqOqY2J7qfN9Qjw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 14:31:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdURL=yMXX2eB9egKtkqJR74yGgX3i87GPdi5vDvHnckPA@mail.gmail.com>
X-Gm-Features: AclHuK--rgFO1C0e0HQwQD6yEG1JbwGYdp5lNKTsg71mKXGvshJw0SrMLwxXcZI
Message-ID: <CAMuHMdURL=yMXX2eB9egKtkqJR74yGgX3i87GPdi5vDvHnckPA@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Looks like I forgot to send the forecast for v7.3, sorry for that.

Next planned releases, if all goes well:
  - renesas-drivers-2026-11-17-v7.4-rc3,
  - renesas-drivers-2026-12-01-v7.4-rc5,
  - renesas-drivers-2026-12-15-v7.4-rc7,
  - renesas-drivers-2026-12-22-v7.4 (TBD),
  - renesas-drivers-2026-12-29-v7.4 (TBD),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
