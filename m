Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610802;
	b=L/1r9x+z/K0ylpV0CJeRnJdWd8+/4JvDlXAs7H4KjInTu80kXOl4t18MwqwZ9m4Tae7n
	 avMhZ79KfUJ/3dn5AK5xnHXdsqtZ70pVCe5ijksKZVJFtpxgm8MbCVE4JSAtZQvGl1J94
	 fdpmIFwpqV5Bw9rbyH8HDl2AKxricMch3Q7IUvPTPN1CEDoOYH/n3X5nnEA/3ZTPIxtTi
	 dAHoYaxHjin/MwOhe30wcIboCeNswXjqHPh0jHh2Im/sYeMlPpedKSEHIWhKpLJvWp2X8
	 TBm+6Fh31NUqOjSh+hiiVuW8Al17ddUl1MbhVKj9DuGbdk7WOVT4CYcshheqfNSAWeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610802;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ac+xpJrvd6zfAE97WIurl+pYtHzF00Lzr1WG7VTrgAw=;
	b=SVxmfCNIq9SmM07gpBS8STADyLQBgN6QHTeJC5HU18xj8pFYWNc8nVtr4YVJA/9XDW/F
	 6GoS57j8eGM5PzHkLLdIbWhG3Zek9T3PYFB1tCKvJX6SjWsd8wGsc1IPyZe8MC1taz638
	 eZuCusHorkhl94pGWwwe2zeSG/5s/VUHiIC2YTspkbI9S+GcCCwzD1nLiEum6neR1P4PF
	 QGID+64Rmi0MgmsuKAiyJYwwNjL8sp2myTVFhUWNn6x0SdAv274zsLeU2aKhC6PB1C2Cx
	 Pqy9gmA8vD3fzmMl//tO466W4qmecl3dAbFniA5AWW/HPk2GwrbzMqCNLcGp0C3QcHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAF7606A326
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 09:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DAF7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533778ab0bdso41452381cf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 01:13:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610801; x=1794215601;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ac+xpJrvd6zfAE97WIurl+pYtHzF00Lzr1WG7VTrgAw=;
        b=GjygO4oAnlQu4UzOfbU/CE5KG60U1aZ2ygeekxJvWXhra73ADmiASv9eQMsjGjGd9B
         pfA7qAJMQhUD7pfyYUdUzcElvTJAF/x7L6pAfHIWkmCcW/3nlLyogu/yEFhWwUcvoWh7
         94QYtPAENFGLitchbx3u8SPU4ABLjft+nRykijVGD/EcQCkaXTds9NDP1g3upIZLn8d4
         NU3+nhhw+GyJfSaoDGjr9hKhpcBJo8pEDw5MmAGW1Ytu5BTll/scne/Cg7mt+Fuhb2D6
         vUy5uotFATrAc9clQah/IiVfIsEMVdN98ZA6Bluk8/rKq2bZXCxEmq3fhwgHMEZ5Aas4
         3xqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNvqWq1u6qpnDrV2mjcs7CXbZ7b8RU7r++njOTUA0bM4IV2P7X6jtv8HcC7qko2j85DSS6O9FcTPsy3rqpJ3Vrnw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzzrgKct9hvGV0wKGo8+lC2bvcBWYD+oeb2sVnT8JaVN30au/3
	9H5Gg7wj81RwvFUXxvdrZ15BbPx7NgdENvCPXy0UQYRTJ7tZ9DnCKVzp0su/RgZf
X-Gm-Gg: AYBFou3Lm6yTQ6eVNK+tDeS1E4uwxTIXrQyC24LlNHeYNoouBBu5hE2VfrBKgMXWaEy
	BE2ObLdX/jPT57AwHE4qhCH5ZDX30otdcRVrURrtUNvOoSroofKItw9KafQqWyGb6fVGdE5SP/+
	2pmOijLRB8PCgNQ0XUqhRbnOzCb2ZMB+sMRAgU81FOAMvC0jWINjfmJ1AEikb2EPwDpTHxGg9nM
	5InA3w67zJG9dP6aGoRetHpbZb3VMGpnwmRc9PWD9ZDd11o+a3agWIDF09MgXL7QDSMIfWigr7D
	zqZXZvvYeDezp8/11g/uKB2LpRWRB/C+FOZvt72gmAD6JG+2rUQdhizi3rk9qX2ipfT5hhXaQ6z
	sinT5MBuu01ZdS9UYWYrrJkAF/+8WEdU8KpJOjyuOmv0TSlzlRoLAV+7bk4vM3bkjkKblu+F7aE
	YHziJH6MDIGR2An9zG5p4F1bdn6pq2BZvWozgjuX44rjpVG+Z9B5N0zgzKO1tKugkTR7LC7GGw5
	k0NS8lJxj/WQNdBsQVEcHX9LIFi5fV5VqmbrlBcCKsbKIib7O9V9ybQfe/gYtcI6BCilfNnbZjc
	tWijUrV7uAGDh/8FLAb6eTOULmVbaBY/anCO69dM50WW3aXLaQaO+JVNVEzkbqZmHibPrA==
X-Received: by 2002:a05:620a:2801:b0:93e:fa30:f1da with SMTP id af79cd13be357-94421698c69mr1636673785a.45.1793610801094;
        Mon, 02 Nov 2026 01:13:21 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425858552sm784700085a.18.2026.11.02.01.13.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:13:20 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93cc1ab5f6cso345088585a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 01:13:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzezyyrt3Q9fYcPpyfZkc7UN2S4cKdnFkyYifh8Hzp4CrQmIW6HAu7oUE+hcSkAKBSRp0SaNtHhklZ6DYR4QeU86w==@vger.kernel.org
X-Received: by 2002:a67:f403:0:b0:7d0:9587:1b90 with SMTP id
 ada2fe7eead31-7d0958732b2mr1205111137.13.1793610463593; Mon, 02 Nov 2026
 01:07:43 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-3-e052903a3832@ideasonboard.com> <20261030220549.GH3178046@killaraus.ideasonboard.com>
In-Reply-To: <20261030220549.GH3178046@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 10:07:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1czCW_KTW8Z+_jb3egLxqBu7bOUmqyXy3PqYhmUfLNg@mail.gmail.com>
X-Gm-Features: AclHuK-1v1dRSgyK1HeeK29l-3g4aKIGNPop6k2nHA1eLryORdmauRDpRhHjRsM
Message-ID: <CAMuHMdX1czCW_KTW8Z+_jb3egLxqBu7bOUmqyXy3PqYhmUfLNg@mail.gmail.com>
Subject: Re: [PATCH DNI v3 03/15] pmdomain: renesas: r8a78000: Add maps for
 VIO for SCP FW SDKv4.36
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 23:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Oct 15, 2026 at 04:51:43PM +0900, Paul Elder wrote:
> > Add maps for VIO for the VSP and FCP power domains and reset domains.
>
> s/reset domains/module control/ as its not just reset (and there's no
> "reset domain") but also module control clock ?

FTR, SCMI calls it "reset domain", but I agree "module controle" fits
better here.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
