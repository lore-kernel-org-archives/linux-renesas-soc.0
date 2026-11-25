Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608911;
	b=1yPzGCUj2xwUm85veKtHpQh+LRTwSbQiJZ2k8Yc9OrFFa7J5yiV2Mzeb0EvPBZs2MJ71
	 JTfOdcNkYCGNBVyo56CvKCbV3ED1bRVdW8L1ix899PwOfDR3QS56Zi+W8SsUrUGXJxa/S
	 d8Nqozdegzw/Leujqz38kSSqIQZ2JzGYMf0kPMw2gHbrOCfLpR7YD7R72sr1J/K9iVtLh
	 L8tIST6xoLggwNXXXzT3f0qTmyHb3ye4nt/t5oOtxn846CqZEjwwH9p/aFYXZ7JOlFOoZ
	 YXGYbrBv3UWBLZxKi0NYFwLe90OmCgMvv9qF6TIlxMbsll3G2OXxFyOcKG57v0Bk0FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YOmjDet4CehHcWMpBY2GAw58yyKf1Sga9AXQjB5h2d8=;
	b=SY7x+7wOxuyHTyOX9oIL8Zk1YKelfsQtz8nxQJXf6RfJjlvu/8Gmva/aZfgPO+Ns7iCR
	 RL3EF0MoBrwZMsi/HWkM913ZOv9bMQ2xBlp9XlrY0/H4IYJz71waBV4nh/kj/oFSEyNn2
	 Vn/cUXHjldOaNqe/DuMU99DMEQHy/0A2FRVgIduwj1xKe2tPTgezURVeHZJ1U/Mrci9kl
	 JNyf7cWj3Gs8LZUN9O248fDaw3bz8qGKAQHoa4LP7FxW5mkXoHiSjwidoBJVH9sYCpirh
	 MfNQME/XRj9tZnoujFQ7oEvyLxnVXpjayoEo1Mb2lxo22PsoaU2BlJjt8TNp9JdFqKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Gla3bR/X";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D8A606A33C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 12:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D8A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gla3bR/X
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so55326375e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608909; x=1796213709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOmjDet4CehHcWMpBY2GAw58yyKf1Sga9AXQjB5h2d8=;
        b=Gla3bR/X3n4K3Z+ZPSeOtToRO8WnV6ERzay8JSw2o4o66TZlk2AtLz4tVhBUGoHmvl
         PndKU8cV6wsff4YzyoK/fjelbiVzBk09L8OUwBw9JqWUmBDluN0b4FFcvEBEmzEKGJEr
         Py3RM8CWfAHH46mfQBDMsJSvOMO61XMhSMfGkXX/hEvFvn3eLoeu56Cl1NaF/8jwr+Fb
         nStF0gx3Hf8atPXEdCjT/tNrWQ7H3jwr+w5AkEz9rROj/PARYakD7XHbaIFx2+7sCJA/
         GuJy8zBCHCzF72ObKP+M+IjtJXEhjIiThKndgjgFXGSW71GmhaQwgifhtDrfFHRd9sdR
         bxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608909; x=1796213709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOmjDet4CehHcWMpBY2GAw58yyKf1Sga9AXQjB5h2d8=;
        b=IxY9kgvefiu4o/uPLJGUkGIg5nYuhrj8O3ihXeIiNFSpaVjiEc1/h1pZrY2AqtgBBb
         5iStustJ1RjgqcZDwxja8sIR5DCpLtq8l6qIkfdAvys5lR8aazImS2/8ar++mHTlSOfT
         Dzw9aHwDCcRShOCV66x189LF7N42jyMoerHtgWd7NLV0i6gu3macroj/NU0vS8aJ6uGI
         DXsa8xAuNvfkHRzDnpcd5Y4IBcOHUYrrpB38QNvgxQ2B6iOmPDnnDHyxgAwyrL1I/H+B
         8SDtr0x674GNKOTuAxGNGr/jm+YKw1B8CDBQAJi/QJWmKTUXZblQE0SroweSdbjeXdOt
         cdJg==
X-Gm-Message-State: APuU4Z+YjkeWCix5DzwF3pbrfiaQkWrbob0tDsm8IWllEXvyfkMqB2yM
	fziKxQ6HofCbuzGxuvt09H+RYoPAV6aVM1NdbSBGM24UaMhQEhIPvwixA+MLgCZQMpQ=
X-Gm-Gg: AZFdTZemBZHxk1JWSqGlpuxBFGlPGWzq/WpRaPi6lpHtNZ77Py7OlZbTTyjx80FVVwR
	R9gWK7igWRqdEW9NTtB70VbmRe4Qj5E3L2+PmPE3u81IJ5PTXNzV39NXxGj3QZEGvje1Bk/eqgL
	MgW8lIqc8rh1ehzssre05VOuluSA5ectDOnFOGVRlspJ2cQBzPI8UYZfOepJsbW5zpy+RNDUEKe
	AIujFOmUXDGTZHs3ZKQWpbzRDC+bgt+15/5bcQWbkKHEND8IorwTlSixuwrputXPM4HaTOPg8BO
	/iWCHEv6M82Hrmkn+lHXpcrqmZw+4+8gIUqn1fmGbtIIKAMuKdeU4328NQUcCL12Yj2Ce4rH1ih
	yx+QAre61hE+CjOd+s2bWjfbX/De7Z5CUF9tZ8zzCQadIviKNAfEz/eWGHPiM4dOalimmU9tkI4
	LWLZ0znvcXT0MJ0m7F5pwZyhn5hf8W5GA9A0MmCiN/UNsl76ymMwsRVn7fYi4Y3INQupf1oKEdH
	ZuAgsIoan9TgoFrNbG7iPC3F5bGWjNAf+ZXC4kqnATqd5sAMIGmYw+frbjVaO/dVkhMnnwtLnVu
	ZwPIkuY26NF/CzeQVgF7DotLhk9d1Ynz4sEkvJArGoE7Zw4Wq3qbGysAWqAayKPd4MrcJekjLFY
	6pW+W1G9Tbdk+T/zM7q18yYRnkmBdUE9aO1eMDAS7SgYvUQyd9TjwEROeL6opeaPQaBeoVM/B2k
	uGX75pSwWv
X-Received: by 2002:a05:600c:a117:b0:4bb:a5e1:7497 with SMTP id 5b1f17b1804b1-4bba5e18d83mr27314105e9.32.1795608908922;
        Wed, 25 Nov 2026 04:15:08 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:08 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] arm64: dts: renesas: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:42 +0000
Message-ID: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series drops the 'snps,perfect-filter-entries' and
'snps,multicast-filter-bins' properties from the GBETH nodes in the
Renesas DTSI files, as these values are derived from the hardware feature
registers by the stmmac driver and do not need to be specified in the
device tree.

Logs:
Before changes, https://gist.github.com/prabhakarlad/5d2530c2508e68d865507aab7f680f07
After changes, https://gist.github.com/prabhakarlad/a4b871a72307a310678c66b803456949

Cheers,
Prabhakar

Lad Prabhakar (6):
  arm64: dts: renesas: r9a09g047: Drop GBETH filter properties
  arm64: dts: renesas: r9a08g046: Drop GBETH filter properties
  arm64: dts: renesas: r9a09g056: Drop GBETH filter properties
  arm64: dts: renesas: r9a09g057: Drop GBETH filter properties
  arm64: dts: renesas: r9a09g077: Drop GBETH filter properties
  arm64: dts: renesas: r9a09g087: Drop GBETH filter properties

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 6 ------
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 6 ------
 6 files changed, 28 deletions(-)

-- 
2.56.1

