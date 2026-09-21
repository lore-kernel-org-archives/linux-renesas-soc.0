Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626E48A2D1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988520; cv=none; b=Gt4jd7d8cm1hBUobrPUZnvLjzspU/HQSWEeqhBO/aScaVlvitXuo8U3wrHdKm5lNGFUUxElmiHC4k8qeeR+dYomufEXlYrWpIEZH2XoLh/miF0+Z+NzCcrdWFGCAse/Awzpw4+TqbxQ6SFter/ASY8ZBwuithuF38Z82DHgwwPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988520; c=relaxed/simple;
	bh=U1zoqHEzQaVfkPpLFBsMt1Td7qlfJLQuz9lR4MKL6Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jixZZ4ZxMKXBGtO3zdlqHRxWGhJOfVdjnNhABg/f9KFJHznaTLx7wh5PNh2O68uYzU0y0V8MEbyJT4T1LQbLBVUyGg6iyJvXdW9jzLHqXf+5Mcpkhp01XLpL18osLkTfqLePE/p68UIM60AlnJKpRGizZ8KzfFzg1VXBDKH+4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rai0Z5SP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rai0Z5SP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso29113205e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988515; x=1790593315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8398NpXiVKPAd2ACHhvzXWJuPnh5bd8fgXOc5fmJggw=;
        b=Rai0Z5SPdwnE/WudB9SbaT5qV6f1C/lcWAmyHAezn6vns96xzGBZ2VQ5Q1rgD21I3n
         0DHmv2YZDgrsjlUbYUPTV7QASwzYkHvKB0X8OQ89/+DSnShAdYmzGR+NniEZa5zNyBi/
         NwJmeZT+5o/1DnF2oZCCSu73ivrowH6QpOLQYlflF6YbBd+c8Oqdoriu92j5xYLv0Hxo
         HRPgDcJpL/Zkh9AR11yeW77QcLodYKvR/2aA6Q2wMtoTkbzJ3pI17OU3pug3hFJW+uo4
         J1TG3fRkYGbDBWkWd/oR8kBeNrYBd4iAfjPr1cQQymKVB4sfbQYbV1uUml6KceieDV4i
         C37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988515; x=1790593315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8398NpXiVKPAd2ACHhvzXWJuPnh5bd8fgXOc5fmJggw=;
        b=w/bj5xO1+slNWTe5mepxmYkoZZtw9YyRbGyO+0FXtc4pbXyDKHRtBB3N/TNHigbz54
         svmSFD7/85CzZc0WcKvTkedX6daG6MxCkW9iRmEqsn7yNiYk2+H/Njt1TYoh7bPnMGXX
         kGEfnUfPjT8dqa7dXa7v2ccfNkPYxhTaofjdhrrFReUw0UMkEffNlTyu1Rc5CA8/BwM2
         UDIFPnnbR/aSHamXlPUP8H+U3pHeFHQE29BkW4eHqrJm1bdB5gQdaR3NmjsjzR9P+vo7
         rfq+79kIhRfTwFmVD16fSfRwpaBgyi+sA8o/ZvGTOZ2PIYh+ZRePAdjawXpRzoCcMNas
         +D1A==
X-Forwarded-Encrypted: i=1; AKwUvBxOhzalTRWr9nUphzCUFWZlSWJh0FtBl1NwLANY1N5RY01pwzdE7P8L/g/ef7s+crV3yflw2y57rIfwkT+JQFlUXw==@vger.kernel.org
X-Gm-Message-State: AFuF++l1/DoZpErHJ0VyRce+GoZgim3r1SkCum3HOxMHwdPcQUXW/3PX
	aZNW30+rCsnVlFZ7DIsfqX/A97sDBnLIyGCOyBro4cQppUO1OdFV7FeE
X-Gm-Gg: AYBFou0YRenyULLqliebkFz5dZcuzKz5GU4gauHCwoBZSCXeZuqTL/UCjMs34fi9PoF
	HDMMx9t899YxL/qpknUGXAXfHZ6x8EHFDPjCuMt2qaTbU/QIZthSgD2FnZo0QVJz4+MKO42X2jP
	RbaHqS4uBc9ScnGk+P3oxZ1xAQwfJazg7xc+ET2t8dyRCzMBiC+vyBDDR4nLoG18+7TNT5UygAr
	u+OYAvUR2A1PZVhLsOO+XKWp+Zj1IXp2tbb3uXO4u/2BOhv9PQYw8az4K8kwL90larSDE23cHYa
	L93xzppKSU4Dnvbirtmh9iriYc63a7X7q8ayTFRlLoIJL1/loQ40jgcPoprQsgDZMiEXqMik3da
	+48PalE7HDL6ZHhuPN1pMM2ITvhYCBnkjXVWp5G1DmMs9n191CzU7+oF1XsB3RxKN6X38arBJJb
	IkahiQGYE36UXEX9RgVV9v64eIQa0NM8bIJYaX2sWIcDhcYKE/cqu/wwgTJpd4sXHMkNT7AsmkC
	lP3U44FFpJuEXXdL6H57+sl2ML+LIt+NBKjj76RT/2Ad7uYjE/A8rO49FdDwjfQ8Te4Z3BVmqzB
	5AXDTM8=
X-Received: by 2002:a05:600c:a085:b0:49d:25b0:cc60 with SMTP id 5b1f17b1804b1-49fc5747f7bmr150529555e9.29.1789988515344;
        Mon, 21 Sep 2026 04:01:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:856:ad4f:1ab5:71b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bc34sm214267425e9.10.2026.09.21.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:01:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Drop unwired ADC interrupts for RZ/T2H and RZN2H SoCs
Date: Mon, 21 Sep 2026 12:01:41 +0100
Message-ID: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series drops unwired ADC interrupts for the RZ/T2H
and RZN2H SoCs.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: iio: adc: renesas,r9a09g077-adc: Drop unwired interrupts
  arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
  arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts

 .../iio/adc/renesas,r9a09g077-adc.yaml         | 10 ++--------
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi     | 18 ++++++------------
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi     | 18 ++++++------------
 3 files changed, 14 insertions(+), 32 deletions(-)

-- 
2.55.0

