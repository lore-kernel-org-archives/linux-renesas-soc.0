Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8A363D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Sep 2024 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725410061; cv=none; b=qyQcaD/kyQhuIcdmLK78Ckw8w1aysRi/IW7gdiGMDkBwQUSunNFigdbObc7PtxuMqEBkzB1nen8qloeSxHfV60AOyzfNfcG7b7znsNLTgqXIs7hgrO/kjZTLxnIfyCpjGZMVtBHvWhknP29mLEttUN9G89p9nBpUaD6Dxx7xum4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725410061; c=relaxed/simple;
	bh=Cu4SIVMt55y8/m+q4qG5N8NuvA40L4PX++E7+hSx/rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p9h7INVIEFKLBd51AFxXRs/HFIH2kDtozSGB6H3LUIHn1Wp1sF7gI2LqQ6TcMjqd9cinVDFQMixPDNetnqsDNHvIc+TPGG+VHAsvLQBibx2DKfjMTZAThPLY2I875M0kwZaO1ZE3rBDhQlRW1cyCc9+TP51aLC9CzkIkeICNgd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.10,200,1719846000"; 
   d="scan'208";a="217429957"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Sep 2024 09:34:12 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0542F4003FB8;
	Wed,  4 Sep 2024 09:34:12 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779h0: Enable PCIe Host
Date: Wed,  4 Sep 2024 09:34:07 +0900
Message-Id: <20240904003409.1578212-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PCIe controller nodes for R-Car V4M (R8A779H0).

The dt-bindings patches for R-Car V4M have been merged into the pci.git /
next branch now [1]. And, it will be merged into v6.12-rc1. So, I think
this patch will be merged into v6.13-rc1?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=next

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779h0: Add PCIe Host and Endpoint nodes
  arm64: dts: renesas: r8a779h0: gray-hawk-single: Enable PCIe Host

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 29 ++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 67 +++++++++++++++++++
 2 files changed, 96 insertions(+)

-- 
2.25.1

