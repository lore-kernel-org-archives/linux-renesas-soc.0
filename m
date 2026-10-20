Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480157;
	b=qUFunqbUte9yefUi/r99GbO0DlXJhONT7tWRbUS8B4bcA8DLNpwFsZER+ig5stM8TX3J
	 jDotmsSaX8ikOe0wg2Xd/2PgaVQe3IUKDnrfFARmwq16WXOVPGRfzbQmbUZl1oxqO0rA/
	 3nPPf+ylDyF/cIqSh73VwBSZwOHrp5CEqLwqpCWK09lqs9vdjbcHYnCUlCfIagdR6tg57
	 xVhZ3uHg5Z1qdRgkhchdrBUR/IgVFsJFefkW+GvIfR203rI6fXIh+ApM/XEFeQ8alR/yI
	 tmyhcsM7H24dhNRfRCHeT8lRZ7cZ0w7/Lhuyfyy5bOGmim8JGLcCFJk1HYhYQPEKr1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480157;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PPF5Lg+md+ScchRlISc/5Y7zr+t9DzuuY8wGaLIwWl4=;
	b=TGqu5cAMGoVsbpxbzN7Z6+ESh+ozlndJc/VliIYF3u+eOsdBvfJnRrAckC/r78QJJV2q
	 5jXllBLwAaZvUL/EdlrCGnkV9cjgbKlCM1H4MM4SeMQRS1Sms6Od9RxPyukvO5f5ihlDb
	 o3pzQD4vG3meyXQRvRoM1olgvR29WYuq92kpKOelXzXNvAVs9NrfGwOlQackqIrNlv1UW
	 B5WNwn5F1Qvddo8tzuNdSktLPN/eWq1Qbndhixwrdw8YQdct1hLx5WX/SHPz4EBJcZZ2I
	 N+VooncW65Pmh5Py4lRd1ULvPoTk9SUEg1kvXlR/4em/TZoaoc/DTDxt/OeID63KIkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC917606A31B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 07:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC917606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so895361137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 00:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480156; x=1793084956;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PPF5Lg+md+ScchRlISc/5Y7zr+t9DzuuY8wGaLIwWl4=;
        b=0ozYqJ3Qupx3dupac/CrdhFOrhMREQLy6YDZSJgWgUAv6t5lUMl6b3CFzOpAfCCuUX
         8Xbg7xHf29Pfwtj41eN6gDvtowS8J7fHUfJTa05dks2vIgMqtUbUiFczDbrnUaOMV8LZ
         xQQbr82UHUb3sN/HT9S3Fnf0i8wgrVPKQPVXzvHOf9R2TaBpleVip8SQpdrIpA63pvgN
         JTw7R79cacfqTCY7xorwW4ibc2r4F4ZtEiNNfn6QcwMxxFgNQs4AWDRsaezioudmvMFw
         9uGBILkH2NP0wnXVlWV7SWqZQ7NdshjUHoI9Z9Q4STkh5HHthIKHDoI9ZuPRByIk9Oaw
         iGeg==
X-Forwarded-Encrypted: i=1; AKwUvBy3tSfOkwIaT2qtSXQ8Msq4g6bguHBnAX2IonIhQRcO0OaTSB6yNI/Vzdy7Mb5og4sKbTAIdYH+UooeC2XLXxhQHg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLBnEt7fUpp3t/Hui9kynj30lgK0ZisbRbTtOqu3KdV0rQGPox3
	SKbkJPOIU/XcOw6Ki8a16NuKbkZyfczfXTLalhjNjYYGHmTXctLbsb5f1QB3h5lD394=
X-Gm-Gg: AYBFou3moj4y+SpIFgHg7t2wY/Px1W52EnS2IndDHVWYL8CVdF/TXQd6/jequDt0FZ9
	/NzcD0Lk0zjdI7imUYC3yZ1nmdqJlh1HjUSVXkLK7MWtzPYv/Gtf06DXVliDR0WpmDKemglkcrT
	ai+ct5lWVtFmOrJmkAPoM4WeNmzRVH+G97gGlj6wOq2DU/U2e441aBj+QN7fnqqExSLHGNlC1cu
	CyCNnCTHRspqYqRRe93jiXCA6HIox8mEST4RwOGEkmtsh1AFpjni6riqHD8hUNMEBvZ86TqflSU
	UPk+ONSSnTtJf2MGZrP+GAtQiwTANeoKcRTJof3lGf11uhNPgXOxfw1T1o9h+yeKSt3AyXSZY5z
	96w+HfGFNAp/quTDewwsSD1EhK7U7aKHLOIVqDQ4+Bp0J4dWkLesSgFuJgus+SfDJXSfSY2CWgU
	jjob2DJhnMgt1oT5NPBBqxXqZTfi+QeZeptJwfaWsYvmz9JhFcIfRuMDEpkOe1haoQxF0MAAV7h
	ufPg/imDRq8K7+/fX4wCOtkOn0Pt2pEGVhc
X-Received: by 2002:a05:6102:26c2:b0:7a6:85d6:8ae0 with SMTP id ada2fe7eead31-7cc36727131mr2467521137.1.1792480155830;
        Tue, 20 Oct 2026 00:09:15 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb25937dsm2271183241.1.2026.10.20.00.09.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:09:14 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso564136241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 00:09:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwoIc+M007fmBCwxt2bimcL7IuF82Ld8RbWWICXgYXTTmvHljRgGC/A2ie296jDqWx7VxPyRQ2vRvrncUgDOhAF0w==@vger.kernel.org
X-Received: by 2002:a05:6102:3753:b0:7cc:1ace:fd0b with SMTP id
 ada2fe7eead31-7cc368f6decmr2272570137.8.1792480154006; Tue, 20 Oct 2026
 00:09:14 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
 <20261019160545.GC3705@killaraus.ideasonboard.com> <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
In-Reply-To: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 09:09:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqgRL+rzQ7xEzn88Guy+KLUHmHyMwAdhfHhC8Xopc7uQ@mail.gmail.com>
X-Gm-Features: AclHuK-xW82aBw8g83Y0vnua8_TBb23MC_WawHBUIyGh3Twhft0MuZERm0ITiqw
Message-ID: <CAMuHMdWqgRL+rzQ7xEzn88Guy+KLUHmHyMwAdhfHhC8Xopc7uQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:32, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 19 Oct 2026 at 18:05, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> > > Unlike provider-based look-up functions in other subsystems[1],
> > > genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> > > the provider is not found, thus not supporting probe deferral.
> > > Currently this is worked around in of_genpd_add_subdomain() by remapping
> > > -ENOENT[2].
> >
> > But not in the other functions calling genpd_get_from_provider() and
> > propagating the error up. Have you validated that no existing call
> > stacks will break ?

Sorry for failing to provide the answer I intended to provide:
IMO all of the callsites should be fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
