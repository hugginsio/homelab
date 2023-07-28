import Image from "next/image";

export default function Home() {
  return (
    <main className="flex h-full m-0 p-0 justify-center items-center">
      <div className="text-center">
        <p className="text-xl font-semibold">
          Trying to access the Huggins Cloud?
        </p>
        <p>Make sure your VPN is enabled and connected.</p>
      </div>
    </main>
  );
}
