import "./globals.css";
import type { Metadata } from "next";
import { Inter } from "next/font/google";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Huggins Cloud",
  description:
    "Trying to access the Huggins Cloud? Make sure your VPN is enabled and connected.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html
      lang="en"
      className="bg-neutral-50 text-neutral-950 dark:bg-neutral-950 dark:text-neutral-50 p-3"
    >
      <body className={inter.className}>{children}</body>
    </html>
  );
}
