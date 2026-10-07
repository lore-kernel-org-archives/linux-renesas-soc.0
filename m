Received: from mta1.migadu.com (out-141.mta1.migadu.com [95.215.58.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2493F38236E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Oct 2026 06:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355579; cv=none; b=Br+QWYFsRC8weNLhDI4gpaAFFJTVmncubenu8Ipo/Pwa3T8i12OonJEWbhZSjl3/E+LSNvGdc/hV+JUZBXTTMGJvTj5NzCzSo5xTcqlZi5hMehhMUEWZcRPzwtlUNnije8zUsOAFgZkJTrsy/NSKDJG00aIMRTBvullMdqWPCaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355579; c=relaxed/simple;
	bh=kEx5juAaGMpPT9V4dZHafbCN0tHJgI/vgPamOMCAtmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9iKMXVJJWJO+lhgmCDRwsQHClGqO04qDXTySz9eS8Yhqq3mDbl4yR8frbBB7m8bvqVo3AyNl6jh/+SMkLK5KwSqa7cTPQZFV8x2XQ3JFWk/hpiVZz55hFnI9LtLdbcxPLrnmUFciZPNhVxaZ7gZwtgWVkdE83FcbF0MB4GGKuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l1jIPsQs; arc=none smtp.client-ip=95.215.58.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l1jIPsQs"
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kEx5juAaGMpPT9V4dZHafbCN0tHJgI/vgPamOMCAtmE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355575; v=1; x=1791960375;
 b=l1jIPsQsHyOuv4fk2DOKqrA2s3fRHGmk7D2ZNADB64zTF3SKWUSUxDHgM3rs42z7XuZOEfUd
 ssRuXTWD7qEFvCwZcj8iXU3upJyPstpm3I986pBP8MeFJtN+VbCdqUwUUgLPFoV9qhT17e58V9j
 efZzQW+ulcXFzC4Y5vrp2oeU=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bcd78634b59a6ec0;
	Wed, 07 Oct 2026 03:23:58 +0000
X-Mizu-Trace-ID: bcd78634b59a6ec0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so4629e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Oct 2026 20:23:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhHo6I47MRkuS4oKo7wfGJhlo/K0wyauzosylx39BsyX2ZTqu05GXfPs2Y31l5pCxPCcFfE1+M30ZFhU7RrXNqMA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKuo2ONfrvveB0u0bi+4J1P3ys4WhlXCN/PWDcPEMEmfMsKwcV3
	fPmoEMun7Jhgnk/FyCrPefCPZe+MXCEdsCyOawsPgXat8z5g4YKqPP1AVtDDdZibyJ/PY+AoVg5
	9xAqjrfKBekLVvPSO+5FwO6YjBVDoXW5jzyfOi45n
X-Received: by 2002:a05:6512:6289:b0:5ba:3602:4343 with SMTP id
 2adb3069b0e04-5bcca678614mr260864e87.16.1791343437807; Tue, 06 Oct 2026
 20:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923180749.3906547-1-fuad.tabba@linux.dev>
In-Reply-To: <20260923180749.3906547-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:23:21 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwPsMqjBgfqAWHxwp1Ujpk7b_BCu_u8WcOekfczFXAMHQ@mail.gmail.com>
X-Gm-Features: AclHuK_rKcz2_xdGb_jpyCXvstLTuyZHAt_pcvOQTxgAvV4JtvZe-_kS7YT5K2Q
Message-ID: <CA+EHjTwPsMqjBgfqAWHxwp1Ujpk7b_BCu_u8WcOekfczFXAMHQ@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: rcar-gen4: Fix device_node leak in rcar_gen4_pcie_host_msi_addr()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

Gentle ping on this fix.

Cheers,
/fuad
