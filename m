Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0C23DE43D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146331; cv=none; b=dLVz7QLlhv6VMu6z7mbh1kpnvYoEaz+YMDXt1kzo2TB6LsbDMBqBbe7JL6WHbhmBHTevB8ZHUgFvMMix2rNbcY+uFKcpJ9bprDlbVu+OwD8gH+m80YW/jr+vlnFH+Tk7l22yJn86DAx5vCg9mIkNn2JkbImLCm6d4YqdVqcHAvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146331; c=relaxed/simple;
	bh=xP4ugZ59cpxKfTb/Au41fWRKXjs5iFn62NUboX+sVQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q8J8EGS37sSptbh39q8WWGA98PqQ+bvKaH7jR6M6HGprdOAhSUrbJk7Ye5zpvGveePeCf5XS4U7KWtKGElJNCpTA5F6p7zyJT2PD3lbPOvw+iIuFo5EOKWGZ0qLzmMb3vdtNI7Kn7EVzkPkM1LJQIvaG3jqw0ZsnOcl/VBzONGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQ+UaHIa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQ+UaHIa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954afac04bso29686065e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785146327; x=1785751127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/QaiMP9acmSAOD+sQgmrkllJ/eryX6bbN2yJkEjt+c=;
        b=SQ+UaHIa92aO6x16G0JOfYVuuzYV+FqoHVxcpfQxvErx4JvWDHW2pPm16vju5hf/47
         gYJavD4WW/lYwjX3/suHcx3fQKVtaGmV5XQ0DCkomHYSZmHa3V+C8CPg66EXzJ/wKLCo
         P7NCkriLO6+Cm5eNP+mlTH8TkJc1bQNyyv4vwtU0ALXQMpvpGI+A0+HxC7Xerz+yoYyw
         sny/WpxrFt4FWNSFIuIhShghaP7RQPGGOWan5pNV5EnhLfOKGT1psxe3jSSu+IdEbM2i
         EgNGPa5WjBQIdVMqWKHk0OrZvhic6YOxXQ1dlCEZ7+2XmoKYOHEZrajIrCvclE1SZUjh
         8R3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146327; x=1785751127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/QaiMP9acmSAOD+sQgmrkllJ/eryX6bbN2yJkEjt+c=;
        b=gCQUbws+NhZOfo5n4LNHvN7OdU9pwOMQcIbhao4ZeLE0kq+xEOXHk/CqRx+Kd5VaS2
         106jDYEabPANQ24I9Fo2qXig/JmwGJifp9KwwnDBbiAamZ0rf+Eq7EEX7X+HRrS1N0Cw
         pLITS2Z/Q+UKKv23gDq1jRkGGwwSXqCgETCHKLK5RrJtwu+RUR1FeLJPlg82V+/YtxL6
         GE091OGIQZhpgXm/R6J4ceUA7qhzkm4xLa3UiBZntDxhWIeOBS+ecYXmKcFqqnjI6q/p
         yJ35Pl0gvgT4T1VJd4Hl21Twx1TVuJVqqSFDdABOqz25VLfXRvE4Nd5D9TQy4EnJkIN5
         dscg==
X-Gm-Message-State: AOJu0YyvGCMN7ksVyz7RqTb6zIhBUhKmlf3WAxqrIfdbG7gj282RDqF0
	GnMaY73wnvyLZuFaPkmBPqq1MnaMwH0ebyrf0FxMLWPD9tlByukU7uh9
X-Gm-Gg: AR+sD13KnxVe6V5V9QlNdqB/SjIweXdVO7GOEUDr+92/pZiG5NZY3oU+pOpnNXwlAj+
	uOEYZAmTnLd41vted84Mk3SE3aiRhmhwKAwM1X6lfGrWnClGyq6uLRhguXhCjQWTkhHzJ4tj8hg
	Ej3lRay2DSzTaYVQ6GRvhzgsytLqU/gOQboTHOhRXyYZ9JQGX1H0sxlDcmK6iLfpWfeqs8OY6vo
	UVPSdQ92JO1ygci702ifIULJhMwRwzoL85qS+/o5C9L9pTofFCSAW3eS1BxAkNLeHZPMaSb9Lga
	U3oaPTMsQfk6bvABa+YiJTbKrzk5ZBbw+agEZmUcHRY/crtNAB0mu0Iku30mKK0Gr7Y2D2DhkR3
	AUGXnH/eQYsYOF/LWDCeW8ZncPuRwF4TUR29bSbspn7vyrNyTyBSdAtH4/fUrTv53bPKYN/juoc
	FgYxXB0EJG38gOWdmXufX1RwXHfKcBR65A1oIG2x0pj4yKw3IKHKTUJ8QIKjlvf+dVjFtPqVxxe
	Azfw84+hryOMulR
X-Received: by 2002:a05:600c:630a:b0:493:cd3f:d051 with SMTP id 5b1f17b1804b1-496b56f1613mr93264455e9.25.1785146327259;
        Mon, 27 Jul 2026 02:58:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8281:5343:33a3:cac0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b842691sm238346295e9.1.2026.07.27.02.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:58:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] PCI: rzg3s: Fix issues in cleanup paths
Date: Mon, 27 Jul 2026 10:58:40 +0100
Message-ID: <20260727095843.116950-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series fixes a few issues in the cleanup paths of the Renesas RZ/G3S
PCIe host controller driver. The fixes include:
- Disabling the PCIe reference clock on probe failure.
- Propagating the original error code from platform_get_irq_byname() to
allow probe deferral.
- Unwinding chained handler registration on error in
rzg3s_pcie_init_irqdomain() and clearing chained handlers in
rzg3s_pcie_teardown_irqdomain() to avoid leaving stale handler and data
pointers attached to the parent interrupts.

Note:
- This patch applies on top of pci-next (commit - 90c4d88be15e).
- There is a patch [0] inflight for this driver which doesn't apply
  on pci-next. As there is a conflict between the two, the patch [0]
  will be rebased on top of this series and v3 will be sent out for review.

[0] https://lore.kernel.org/all/20260630141720.3938514-1-john.madieu.xa@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  PCI: rzg3s: Disable refclk on probe failure
  PCI: rzg3s: Propagate platform_get_irq_byname() errors
  PCI: rzg3s: Fix IRQ domain initialization error handling

 drivers/pci/controller/pcie-rzg3s-host.c | 50 ++++++++++++++++++------
 1 file changed, 37 insertions(+), 13 deletions(-)


base-commit: 90c4d88be15e11c1e922ef93e611b5e28103e37b
-- 
2.54.0

